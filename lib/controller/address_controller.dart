import 'dart:async';
import 'package:get/get.dart';
import 'package:responsive_login_ui/data/model/district.dart';
import 'package:responsive_login_ui/data/model/province.dart';
import 'package:responsive_login_ui/data/repository/address_repo.dart';
import 'package:responsive_login_ui/json_file/read_file_json/read_file_json.dart';
import '../data/model/ward.dart';
import '../data/provider/db/storage_database.dart';

class AddressController extends GetxController {
  final AddressRepo addressRepo;

  AddressController({required this.addressRepo});

  String? _provinceType;
  String? get provinceType => _provinceType;
  set provinceType(String? type) {
    _provinceType = type;
    update();
  }

  String? _provinceID;
  set provinceID(String? id) {
    _provinceID = id;
    update();
  }

  String? _districtType;
  String? get districtType => _districtType;
  set districtType(String? type) {
    _districtType = type;
    update();
  }

  String? _districtID;
  set districtID(String? id) {
    _districtID = id;
    update();
  }

  bool _isEnableDistrictText = false;
  bool get isEnableDistrictText => _isEnableDistrictText;
  set isEnableDistrictText(bool? isSelect) {
    _isEnableDistrictText = isSelect!;
    update();
  }

  String? _wardType;
  String? get wardType => _wardType;
  set wardType(String? type) {
    _wardType = type;
    update();
  }

  bool _isEnableWardText = false;
  bool get isEnableWardText => _isEnableWardText;
  set isEnableWardText(bool? isSelect) {
    _isEnableWardText = isSelect!;
    update();
  }

  bool _isEnableVillageText = false;
  bool get isEnableVillageText => _isEnableVillageText;
  set isEnableVillageText(bool? isSelect) {
    _isEnableVillageText = isSelect!;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    StorageDatabase.instance.close();
  }

  // Processed database
  Future<void> createProvincesToDB() async {
    List<Province>? provinces = await addressRepo.readAllProvincesFromDB();
    if (provinces == null) {
      List<Province>? provincesFromJson =
          await readFileProvinceJson("lib/json_file/tinh_tp.json");
      if (provinces!.isNotEmpty) {
        await addressRepo.createProvincesToDB(provinces: provincesFromJson);
        print("Created provinces to DB");
      }
    } else {
      print("Don't read from json file");
    }
  }

  Future<void> createDistrictToDB() async {
    List<District>? districtsByProvinceID =
        await addressRepo.readAllDistrictByParentIDFromDB(_provinceID!);
    if (districtsByProvinceID == null) {
      List<District>? districts = await readFileDistrictJson(
          "lib/json_file/quan-huyen/$_provinceID.json");
      if (districts!.isNotEmpty) {
        await addressRepo.createDistrictToDB(districts: districts);
        print("Created district to DB");
      }
    } else {
      print("Don't read from json file");
    }
  }

  Future<void> createWardToDB() async {
    List<Ward>? wardsByDistrictID =
        await addressRepo.readAllWardByParentIDFromDB(_districtID!);
    if (wardsByDistrictID == null) {
      List<Ward>? wards =
          await readFileWardJson("lib/json_file/xa-phuong/$_districtID.json");
      if (wards!.isNotEmpty) {
        await addressRepo.createWardToDB(wards: wards);
        print("Created ward to DB");
      }
    } else {
      print("Don't read from json file");
    }
  }

  // Province
  Future<List<Province>> getProvinceSuggestions(String? query) async {
    List<Province> results = [];
    List<Province>? provinces = await addressRepo.readAllProvincesFromDB();
    if (provinces!.isNotEmpty) {
      if (query != null) {
        Province? provinceByname =
            await addressRepo.readProvinceByNameFromDB(query);
        if (provinceByname != null) {
          _provinceID = provinceByname.id;
          _provinceType = provinceByname.type;
          await createDistrictToDB();
        } else {
          _provinceID = null;
          _provinceType = null;
        }
      }
      results = provinces;
    }

    return results
        .where(
          (Province province) => province.name!.toLowerCase().startsWith(
                query!.toLowerCase(),
              ),
        )
        .toList();
  }

  // District
  Future<List<District>> getDistrictSuggestions(String? query) async {
    List<District> results = [];
    if (_provinceID != null) {
      List<District>? districts =
          await addressRepo.readAllDistrictByParentIDFromDB(_provinceID!);
      if (districts!.isNotEmpty) {
        if (query != null) {
          District? districtByname =
              await addressRepo.readDistrictByNameFromDB(query);
          if (districtByname != null) {
            _districtID = districtByname.id;
            _districtType = districtByname.type;
            await createWardToDB();
          } else {
            _districtID = null;
            _districtType = null;
          }
        }
        results = districts;
      }
    }
    return results
        .where(
          (District district) => district.name!.toLowerCase().startsWith(
                query!.toLowerCase(),
              ),
        )
        .toList();
  }

  // Ward
  Future<List<Ward>> getWardSuggestions(String? query) async {
    List<Ward> results = [];
    if (_districtID != null) {
      List<Ward>? wards =
          await addressRepo.readAllWardByParentIDFromDB(_districtID!);
      if (wards!.isNotEmpty) {
        if (query != null) {
          Ward? wardByname = await addressRepo.readWardBynameFromDB(query);
          if (wardByname != null) {
            _wardType = wardByname.type;
          } else {
            _wardType = null;
          }
        }
        results = wards;
      }
    }
    return results
        .where(
          (Ward ward) => ward.name!.toLowerCase().startsWith(
                query!.toLowerCase(),
              ),
        )
        .toList();
  }
}
