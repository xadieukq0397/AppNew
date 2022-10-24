import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/controller/checkout_controller.dart';

class SelectTransport extends StatelessWidget {
  SelectTransport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    Obx(
                      () => Radio(
                        value: "Giao hàng tiết kiệm",
                        groupValue: checkOutController.selectTransport.value,
                        onChanged: (value) {
                          checkOutController.onChangedTransport(value);
                        },
                      ),
                    ),
                    Text("Giao hàng tiết kiệm")
                  ],
                ),
                Row(
                  children: [
                    Obx(
                      () => Radio(
                        value: "Giao hàng nhanh",
                        groupValue: checkOutController.selectTransport.value,
                        onChanged: (value) {
                          checkOutController.onChangedTransport(value);
                        },
                      ),
                    ),
                    Text("Giao hàng nhanh")
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.55,
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
    );
  }
}
