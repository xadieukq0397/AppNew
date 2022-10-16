import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/controller/order_controller.dart';
import '../controller/product_controller.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              'assets/eugene-chystiakov-3neSwyntbQ8-unsplash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Chair",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset('assets/star.png'),
                        const SizedBox(width: 10),
                        const Text(
                          '4.5',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Detail",
                      style: TextStyle(fontSize: 26),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. ",
                      style: TextStyle(height: 2.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: const [
                    Text(
                      "PRICE",
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                    Text("\$ 200"),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Get.find<ProductController>().createProductToDB();
                    // Get.find<ProductController>().readAllProductFromDB();
                    // Get.find<AuthController>().createUserToDB();
                    // Get.find<AuthController>().readAllUserFromDB();
                    // Get.find<CartController>().createCartToDB();
                    // Get.find<CartController>().readAllCartByOrderIdFromDB('1');
                    // Get.find<OrderController>().createOrderToDB();
                    // Get.find<OrderController>().readAllOrderByUserIdFromDB('2');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                    child: const Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
