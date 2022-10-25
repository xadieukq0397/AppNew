import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/checkout_controller.dart';
import 'package:responsive_login_ui/controller/order_controller.dart';
import 'package:responsive_login_ui/views/widgets/select_address.dart';
import '../../routes/routes.dart';

class AddressCheckOut extends StatelessWidget {
  const AddressCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _provinceController = TextEditingController();
    TextEditingController _districtController = TextEditingController();
    TextEditingController _wardController = TextEditingController();
    TextEditingController _villageController = TextEditingController();

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
                      const Text("Enter Bill Code"),
                    ],
                  ),
                  checkOutController.selectTypeDelivery == "billCode"
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                              controller: _villageController,
                              decoration: const InputDecoration(
                                hintText: "Enter Bill Code",
                                border: OutlineInputBorder(
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
                        },
                      ),
                      const Text("Enter Customer's Address"),
                    ],
                  ),
                  checkOutController.selectTypeDelivery == "address"
                      ? SelectAddress(
                          provinceController: _provinceController,
                          districtController: _districtController,
                          wardController: _wardController,
                          villageController: _villageController,
                          distance: 5,
                        )
                      : const SizedBox(
                          height: 15,
                        ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                Map<String, dynamic> query = {
                  "address": "Xóm 9, Xuân Hồng",
                  "province": "Nam Định",
                  "district": "Xuân Trường",
                  "pick_province": "Hà Nội",
                  "pick_district": "Thanh Xuân",
                  "weight": "100000",
                  "value": "300000",
                  "deliver_option": "none",
                };

                await Get.find<OrderController>().getDataTransportFee(query);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xff00C569),
                ),
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
