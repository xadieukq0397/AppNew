import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/address_controller.dart';
import 'package:responsive_login_ui/data/model/district.dart';
import 'package:responsive_login_ui/data/model/province.dart';
import '../data/model/ward.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _provinceController = TextEditingController();
    TextEditingController _districtController = TextEditingController();
    TextEditingController _wardController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Province
              GetBuilder<AddressController>(builder: (provinceController) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: TypeAheadField<Province?>(
                    hideSuggestionsOnKeyboardHide: true,
                    debounceDuration: const Duration(milliseconds: 500),
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: _provinceController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText:
                              AppLocalizations.of(context)!.searchProvince,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty || value == '') {
                            _districtController.text = "";
                            _wardController.text = "";
                            provinceController.isEnableDistrictText = false;
                          } else {
                            provinceController.isEnableDistrictText = true;
                          }
                        }),
                    suggestionsCallback: (String pattern) async {
                      return await Get.find<AddressController>()
                          .getProvinceSuggestions(pattern);
                    },
                    itemBuilder: (context, Province? suggestion) {
                      final province = suggestion!;
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                province.name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.color,
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    onSuggestionSelected: (Province? suggestion) async {
                      final province = suggestion!;
                      _provinceController.text = province.name!;
                      provinceController.provinceID = province.id;
                      provinceController.provinceType = province.type;
                      provinceController.isEnableDistrictText = true;
                      provinceController.createDistrictToDB();
                    },
                    noItemsFoundBuilder: (context) => Center(
                      child: Text(
                        AppLocalizations.of(context)!.searchNotFound,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              // District
              GetBuilder<AddressController>(builder: (districtController) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    child: TypeAheadField<District?>(
                      hideSuggestionsOnKeyboardHide: true,
                      textFieldConfiguration: TextFieldConfiguration(
                          enabled:
                              Get.find<AddressController>().isEnableDistrictText
                                  ? true
                                  : false,
                          controller: _districtController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText:
                                AppLocalizations.of(context)!.searchDistrict,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isEmpty || value == '') {
                              _wardController.text = "";
                              districtController.isEnableWardText = false;
                            } else {
                              districtController.isEnableWardText = true;
                            }
                          }),
                      suggestionsCallback: (String pattern) async {
                        return await Get.find<AddressController>()
                            .getDistrictSuggestions(pattern);
                      },
                      itemBuilder: (context, District? suggestion) {
                        final district = suggestion!;
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  district.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.color,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      onSuggestionSelected: (District? suggestion) async {
                        final district = suggestion!;
                        _districtController.text = district.name!;
                        districtController.districtID = district.id;
                        districtController.districtType = district.type;
                        districtController.isEnableWardText = true;
                        districtController.createWardToDB();
                      },
                      noItemsFoundBuilder: (context) => Center(
                        child: Text(
                          AppLocalizations.of(context)!.searchNotFound,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              // Ward
              GetBuilder<AddressController>(builder: (wardController) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: TypeAheadField<Ward?>(
                    hideSuggestionsOnKeyboardHide: true,
                    textFieldConfiguration: TextFieldConfiguration(
                      enabled: Get.find<AddressController>().isEnableWardText
                          ? true
                          : false,
                      controller: _wardController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: AppLocalizations.of(context)!.searchWard,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    suggestionsCallback: (String pattern) async {
                      return await Get.find<AddressController>()
                          .getWardSuggestions(pattern);
                    },
                    itemBuilder: (context, Ward? suggestion) {
                      final ward = suggestion!;
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                ward.name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.color,
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    onSuggestionSelected: (Ward? suggestion) {
                      final ward = suggestion!;
                      _wardController.text = ward.name!;
                      wardController.wardType = ward.type;
                    },
                    noItemsFoundBuilder: (context) => Center(
                      child: Text(
                        AppLocalizations.of(context)!.searchNotFound,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 40),
              GetBuilder<AddressController>(builder: (addressController) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_provinceController.text.trim().isEmpty) {
                          Get.snackbar(
                              AppLocalizations.of(context)!
                                  .notSelectProvinceOne,
                              AppLocalizations.of(context)!
                                  .notSelectProvinceTwo,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (_districtController.text.trim().isEmpty) {
                          Get.snackbar(
                              AppLocalizations.of(context)!
                                  .notSelectDistrictOne,
                              AppLocalizations.of(context)!
                                  .notSelectDistrictTwo,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (_wardController.text.trim().isEmpty) {
                          Get.snackbar(
                              AppLocalizations.of(context)!.notSelectWardOne,
                              AppLocalizations.of(context)!.notSelectWardTwo,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (addressController.provinceType == null) {
                          Get.snackbar(
                            AppLocalizations.of(context)!.errSelectProvinceOne,
                            AppLocalizations.of(context)!.errSelectProvinceTwo,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          _provinceController.text = "";
                          _districtController.text = "";
                          _wardController.text = "";
                          addressController.isEnableDistrictText = false;
                          addressController.isEnableWardText = false;
                        } else if (addressController.districtType == null) {
                          Get.snackbar(
                            AppLocalizations.of(context)!.errSelectDistrictOne,
                            AppLocalizations.of(context)!.errSelectDistrictTwo,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          _districtController.text = "";
                          _wardController.text = "";
                          addressController.isEnableWardText = false;
                        } else if (addressController.wardType == null) {
                          Get.snackbar(
                            AppLocalizations.of(context)!.errSelectWardOne,
                            AppLocalizations.of(context)!.errSelectWardTwo,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          _wardController.text = "";
                        } else {
                          String addressString =
                              "${addressController.wardType} ${_wardController.text}, "
                              "${addressController.districtType} ${_districtController.text}, "
                              "${addressController.provinceType} ${_provinceController.text}";
                          print("Address is: " + addressString);
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.agreeButton),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
