import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

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
                'Your Cart',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GetBuilder<CartController>(
            builder: (cartController) => cartController.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (cartController.carts == null ||
                        cartController.carts!.isEmpty)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/empty_cart.png',
                              height: 200,
                              width: 200,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Cart Empty',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: MediaQuery.removePadding(
                                removeTop: true,
                                context: context,
                                child: ListView.builder(
                                  itemCount: cartController.carts!.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 5, bottom: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          width: 220,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartController
                                                    .carts![index].productName!,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Price: ",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  Text(
                                                    '${cartController.carts![index].unitPrice}',
                                                    style: const TextStyle(
                                                        color: Colors.green),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartController
                                                      .increment(index);
                                                },
                                                child: const Icon(Icons.add,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(width: 20),
                                              Text(
                                                  '${cartController.carts![index].quantity}'),
                                              const SizedBox(width: 20),
                                              GestureDetector(
                                                onTap: () {
                                                  cartController
                                                      .decrement(index);
                                                },
                                                child: const Icon(Icons.remove,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Total',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.grey),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        cartController.totalPrice.toString(),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff00C569),
                                    ),
                                    child: const Text(
                                      'Check out',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
