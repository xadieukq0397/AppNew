import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/address_controller.dart';
import '../../data/model/district.dart';
import '../../data/model/province.dart';
import '../../data/model/ward.dart';

import 'package:responsive_login_ui/bindings/address_bindings.dart'
    as address_bindings;

class SelectAddress extends StatelessWidget {
  const SelectAddress({
    Key? key,
    required this.provinceController,
    required this.districtController,
    required this.wardController,
    required this.villageController,
    this.distance = 20,
  }) : super(key: key);

  final TextEditingController provinceController;
  final TextEditingController districtController;
  final TextEditingController wardController;
  final TextEditingController villageController;
  final double distance;

  @override
  Widget build(BuildContext context) {
    address_bindings.dependencies();
    Get.find<AddressController>().createProvincesToDB();
    return GetBuilder<AddressController>(
      builder: (addressController) => Column(
        children: [
          // Province
          Padding(
            padding: const EdgeInsets.all(16),
            child: TypeAheadField<Province?>(
              hideSuggestionsOnKeyboardHide: true,
              debounceDuration: const Duration(milliseconds: 500),
              textFieldConfiguration: TextFieldConfiguration(
                  controller: provinceController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: AppLocalizations.of(context)!.searchProvince,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty || value == '') {
                      districtController.text = "";
                      wardController.text = "";
                      addressController.isEnableDistrictText = false;
                    } else {
                      addressController.isEnableDistrictText = true;
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
                          style:
                              Theme.of(context).textTheme.headline2?.copyWith(
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
                provinceController.text = province.name!;
                addressController.provinceID = province.provinceId;
                addressController.provinceType = province.type;
                addressController.isEnableDistrictText = true;
                addressController.createDistrictToDB();
              },
              noItemsFoundBuilder: (context) => Center(
                child: Text(
                  AppLocalizations.of(context)!.searchNotFound,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),

          SizedBox(height: distance),
          // District
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              child: TypeAheadField<District?>(
                hideSuggestionsOnKeyboardHide: true,
                textFieldConfiguration: TextFieldConfiguration(
                    enabled:
                        addressController.isEnableDistrictText ? true : false,
                    controller: districtController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: AppLocalizations.of(context)!.searchDistrict,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isEmpty || value == '') {
                        wardController.text = "";
                        addressController.isEnableWardText = false;
                      } else {
                        addressController.isEnableWardText = true;
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
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
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
                  districtController.text = district.name!;
                  addressController.districtID = district.districtId;
                  addressController.districtType = district.type;
                  addressController.isEnableWardText = true;
                  addressController.createWardToDB();
                },
                noItemsFoundBuilder: (context) => Center(
                  child: Text(
                    AppLocalizations.of(context)!.searchNotFound,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: distance),
          // Ward
          Padding(
            padding: const EdgeInsets.all(16),
            child: TypeAheadField<Ward?>(
              hideSuggestionsOnKeyboardHide: true,
              textFieldConfiguration: TextFieldConfiguration(
                  enabled: addressController.isEnableWardText ? true : false,
                  controller: wardController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: AppLocalizations.of(context)!.searchWard,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty || value == '') {
                      villageController.text = "";
                      addressController.isEnableVillageText = false;
                    } else {
                      addressController.isEnableVillageText = true;
                    }
                  }),
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
                          style:
                              Theme.of(context).textTheme.headline2?.copyWith(
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
                wardController.text = ward.name!;
                addressController.wardType = ward.type;
                addressController.isEnableVillageText = true;
              },
              noItemsFoundBuilder: (context) => Center(
                child: Text(
                  AppLocalizations.of(context)!.searchNotFound,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),

          SizedBox(height: distance),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
                enabled: addressController.isEnableVillageText ? true : false,
                controller: villageController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.searchVillage,
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onChanged: (value) async {}),
          )
        ],
      ),
    );
  }
}
