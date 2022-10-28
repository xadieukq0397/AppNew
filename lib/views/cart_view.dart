import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_login_ui/routes/routes.dart';

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
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.titleCart,
                style: const TextStyle(
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
                            Text(
                              AppLocalizations.of(context)!.textEmptyCart,
                              style: const TextStyle(
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
                                                  Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .textPrice,
                                                    style: const TextStyle(
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
                                      Text(
                                        AppLocalizations.of(context)!.textTotal,
                                        style: const TextStyle(
                                            fontSize: 22, color: Colors.grey),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        cartController.subTotalPrice.toString(),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          Routes.getSelectTransportPage());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff00C569),
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .chekoutButton,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
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
