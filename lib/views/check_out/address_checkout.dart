import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/controller/checkout_controller.dart';

class AddressCheckOut extends StatelessWidget {
  CheckOutController checkOutController = Get.put(CheckOutController());
  AddressCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blueAccent,
              child: const Center(
                child: Text(
                  'ADDRESS DELIVERY',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              child: GetBuilder<CheckOutController>(
                builder: (checkOutController) => Column(
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: "Nhập mã vận đơn",
                            groupValue:
                                checkOutController.selectTypeDelivery.value,
                            onChanged: (value) {
                              checkOutController.onChangedDelivery(value);
                            },
                          ),
                        ),
                        Text("Nhập mã vận đơn"),
                      ],
                    ),
                    Obx(
                      () => checkOutController.selectTypeDelivery.value ==
                              "Nhập mã vận đơn"
                          ? Container(
                              child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Nhập mã vận đơn đã có",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                        color: Colors.white54,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                        color: Colors.white54,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) async {
                                    checkOutController.onChangedBillCode(value);
                                  }),
                            )
                          : SizedBox(
                              height: 15,
                            ),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: "Nhập địa chỉ",
                            groupValue:
                                checkOutController.selectTypeDelivery.value,
                            onChanged: (value) {
                              checkOutController.onChangedDelivery(value);
                            },
                          ),
                        ),
                        Text("Nhập địa chỉ"),
                      ],
                    ),
                    Obx(
                      () => checkOutController.selectTypeDelivery.value ==
                              "Nhập địa chỉ"
                          ? Container(
                              child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Nhập địa chỉ khách hàng",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                        color: Colors.white54,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                        color: Colors.white54,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) async {
                                    checkOutController
                                        .onChangedAddressGuess(value);
                                  }),
                            )
                          : SizedBox(
                              height: 15,
                            ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xff00C569),
              ),
              child: const Text(
                'NEXT',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
