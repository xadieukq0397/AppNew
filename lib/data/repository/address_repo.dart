import '../model/district.dart';
import '../model/province.dart';
import '../model/ward.dart';
import '../provider/db/storage_database.dart';

class AddressRepo {
  // Provinces
  Future<void> createProvincesToDB({List<Province>? provinces}) async {
    for (int i = 0; i < provinces!.length; i++) {
      if (provinces[i] is Province) {
        Province? province;
        province = await readProvinceByIDFromDB(id: provinces[i].provinceId);
        if (province == null) {
          await StorageDatabase.instance.createProvinceToDB(provinces[i]);
        }
      }
    }
  }

  Future<Province?> readProvinceByIDFromDB({String? id}) async {
    Province? province =
        await StorageDatabase.instance.readProvinceByIDFromDB(id);
    return province;
  }

  Future<Province?> readProvinceByNameFromDB(String? name) async {
    Province? province =
        await StorageDatabase.instance.readProvinceByNameFromDB(name);
    return province;
  }

  Future<List<Province>?> readAllProvincesFromDB() async {
    List<Province>? provinces =
        await StorageDatabase.instance.readAllProvinceFromDB();
    return provinces;
  }

  // District
  Future<void> createDistrictToDB({List<District>? districts}) async {
    for (int i = 0; i < districts!.length; i++) {
      if (districts[i] is District) {
        District? district;
        district = await readDistrictByIDFromDB(id: districts[i].districtId);
        if (district == null) {
          await StorageDatabase.instance.createDistrictToDB(districts[i]);
        }
      }
    }
  }

  Future<District?> readDistrictByIDFromDB({String? id}) async {
    District? district =
        await StorageDatabase.instance.readDistrictByIDFromDB(id);
    return district;
  }

  Future<District?> readDistrictByNameFromDB(String? name) async {
    District? district =
        await StorageDatabase.instance.readDistrictByNameFromDB(name);
    return district;
  }

  Future<List<District>?> readAllDistrictByParentIDFromDB(
      String provinceId) async {
    List<District>? districts = await StorageDatabase.instance
        .readAllDistrictByParentIDFromDB(provinceId);
    return districts;
  }

  // Ward
  Future<void> createWardToDB({List<Ward>? wards}) async {
    for (int i = 0; i < wards!.length; i++) {
      if (wards[i] is Ward) {
        Ward? ward;
        ward = await readWardByIDFromDB(id: wards[i].wardId);
        if (ward == null) {
          await StorageDatabase.instance.createWardToDB(wards[i]);
        }
      }
    }
  }

  Future<Ward?> readWardByIDFromDB({String? id}) async {
    Ward? ward = await StorageDatabase.instance.readWardByIDFromDB(id!);
    return ward;
  }

  Future<Ward?> readWardBynameFromDB(String? name) async {
    Ward? ward = await StorageDatabase.instance.readWardByNameFromDB(name);
    return ward;
  }

  Future<List<Ward>?> readAllWardByParentIDFromDB(String districtId) async {
    List<Ward>? wards =
        await StorageDatabase.instance.readAllWardByParentIDFromDB(districtId);
    return wards;
  }
}
