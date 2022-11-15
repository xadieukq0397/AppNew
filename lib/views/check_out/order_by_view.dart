import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/address_controller.dart';
import 'package:responsive_login_ui/controller/checkout_controller.dart';
import 'package:responsive_login_ui/controller/order_controller.dart';
import 'package:responsive_login_ui/views/widgets/select_address.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/cart_controller.dart';
import '../../routes/routes.dart';

class OrderByView extends StatelessWidget {
  const OrderByView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CheckOutController());
    TextEditingController _customerNameController = TextEditingController();
    TextEditingController _phoneNumberController = TextEditingController();
    TextEditingController _provinceController = TextEditingController();
    TextEditingController _districtController = TextEditingController();
    TextEditingController _wardController = TextEditingController();
    TextEditingController _villageController = TextEditingController();
    TextEditingController _billCodeController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.delete<CheckOutController>();
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          AppLocalizations.of(context)!.titleOrderBy,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<CheckOutController>(
              builder: (checkOutController) => Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: "billCode",
                        groupValue: checkOutController.selectTypeDelivery,
                        onChanged: (value) {
                          checkOutController.onChangedDelivery(value);
                        },
                      ),
                      Text(AppLocalizations.of(context)!.titleBillCode),
                    ],
                  ),
                  checkOutController.selectTypeDelivery == "billCode"
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                              controller: _billCodeController,
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!
                                    .textFieldBillCode,
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              onChanged: (value) async {
                                checkOutController.onChangedBillCode(value);
                              }),
                        )
                      : const SizedBox(
                          height: 15,
                        ),
                  Row(
                    children: [
                      Radio(
                        value: "address",
                        groupValue: checkOutController.selectTypeDelivery,
                        onChanged: (value) {
                          checkOutController.onChangedDelivery(value);
                          checkOutController.isSelected = false;
                          checkOutController.selectXfast = 'none';
                        },
                      ),
                      Text(AppLocalizations.of(context)!.titleCustomerAddress),
                    ],
                  ),
                  checkOutController.selectTypeDelivery == "address"
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextField(
                                  controller: _customerNameController,
                                  decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context)!
                                        .customerName,
                                    prefixIcon: const Icon(Icons.search),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onChanged: (value) async {}),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextField(
                                  controller: _phoneNumberController,
                                  decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context)!
                                        .phoneNumber,
                                    prefixIcon: const Icon(Icons.search),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onChanged: (value) async {}),
                            ),
                            const SizedBox(height: 5),
                            SelectAddress(
                              provinceController: _provinceController,
                              districtController: _districtController,
                              wardController: _wardController,
                              villageController: _villageController,
                              distance: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  value: checkOutController.isSelected,
                                  onChanged: (bool? value) {
                                    checkOutController.isSelected = value!;
                                    checkOutController.onSelectXfast(value);
                                  },
                                ),
                                Text(
                                  AppLocalizations.of(context)!.selectXfast,
                                ),
                                const SizedBox(width: 18),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 5),
            GetBuilder<OrderController>(
              builder: (orderController) {
                return GestureDetector(
                  onTap: () async {
                    if (Get.find<CheckOutController>().selectTypeDelivery ==
                        null) {
                      Get.snackbar(
                          AppLocalizations.of(context)!.notSelectOrderBy,
                          AppLocalizations.of(context)!.selectOrderBy,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    } else if (Get.find<CheckOutController>()
                            .selectTypeDelivery ==
                        'address') {
                      if (_customerNameController.text.trim().isEmpty) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.errorCustomerName,
                          AppLocalizations.of(context)!.enterCustomerName,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else if (_phoneNumberController.text.trim().isEmpty) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.errorphoneCustomer,
                          AppLocalizations.of(context)!.enterPhoneCustomer,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else if (_provinceController.text.trim().isEmpty) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.notSelectProvinceOne,
                          AppLocalizations.of(context)!.notSelectProvinceTwo,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else if (_districtController.text.trim().isEmpty) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.notSelectDistrictOne,
                          AppLocalizations.of(context)!.notSelectDistrictTwo,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else if (_wardController.text.trim().isEmpty) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.notSelectWardOne,
                          AppLocalizations.of(context)!.notSelectWardTwo,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else if (_villageController.text.trim().isEmpty) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.notSelectVillageOne,
                          AppLocalizations.of(context)!.notSelectVillageOne,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else if (Get.find<AddressController>().provinceType ==
                          null) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.errSelectProvinceOne,
                          AppLocalizations.of(context)!.errSelectProvinceTwo,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        _provinceController.text = "";
                        _districtController.text = "";
                        _wardController.text = "";
                        _villageController.text = "";
                        Get.find<AddressController>().isEnableDistrictText =
                            false;
                        Get.find<AddressController>().isEnableWardText = false;
                        Get.find<AddressController>().isEnableVillageText =
                            false;
                      } else if (Get.find<AddressController>().districtType ==
                          null) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.errSelectDistrictOne,
                          AppLocalizations.of(context)!.errSelectDistrictTwo,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        _districtController.text = "";
                        _wardController.text = "";
                        _villageController.text = "";
                        Get.find<AddressController>().isEnableWardText = false;
                        Get.find<AddressController>().isEnableVillageText =
                            false;
                      } else if (Get.find<AddressController>().wardType ==
                          null) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.errSelectWardOne,
                          AppLocalizations.of(context)!.errSelectWardTwo,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        _wardController.text = "";
                        _villageController.text = "";
                        Get.find<AddressController>().isEnableVillageText =
                            false;
                      } else {
                        orderController.query = {
                          'address': _villageController.text,
                          'ward': _wardController.text,
                          'district': _districtController.text,
                          'province': _provinceController.text,
                          "pick_province": "Hà Nội",
                          "pick_district": "Thanh Xuân",
                          "weight": "${Get.find<CartController>().totalWeight}",
                          "value":
                              "${Get.find<CartController>().subTotalPrice}",
                          "deliver_option":
                              Get.find<CheckOutController>().selectXfast,
                        };
                        orderController.customerName =
                            _customerNameController.text;
                        orderController.phoneCustomer =
                            _phoneNumberController.text;
                        orderController.addressCustomer =
                            "${_villageController.text}, "
                            "${_wardController.text}, "
                            "${_districtController.text}, "
                            "${_provinceController.text}";
                        await orderController.createAnOrder();
                        Get.offAllNamed(Routes.getControlViewPage());
                      }
                    } else if (Get.find<CheckOutController>()
                            .selectTypeDelivery ==
                        'billCode') {
                      if (_billCodeController.text.trim().isEmpty) {
                        Get.snackbar(
                          AppLocalizations.of(context)!.notEnterBillCodeOne,
                          AppLocalizations.of(context)!.notEnterBillCodeTwo,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else {
                        Get.toNamed(Routes.getControlViewPage());
                        orderController
                            .getStatusOrder(_billCodeController.text.trim());
                      }
                    }
                  },
                  child: orderController.isCreate
                      ? Container(
                          width: 200,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xff00C569),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(
                          width: 200,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xff00C569),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.orderButton,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
