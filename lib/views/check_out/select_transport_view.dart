import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/checkout_controller.dart';
import '../../routes/routes.dart';

class SelectTransport extends StatelessWidget {
  const SelectTransport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                'Select Your Transport',
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
                      value: "economical",
                      groupValue: checkOutController.selectTransport,
                      onChanged: (value) {
                        checkOutController.onChangedTransport(value);
                      },
                    ),
                    const Text("Giao hàng tiết kiệm")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "fast",
                      groupValue: checkOutController.selectTransport,
                      onChanged: (value) {
                        checkOutController.onChangedTransport(value);
                      },
                    ),
                    const Text("Giao hàng nhanh")
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.getSelectDeliveryPage());
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
    );
  }
}
