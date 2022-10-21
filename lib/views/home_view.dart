import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import '../constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().readAllProductFromDB();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 18, right: 18),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search your something",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) async {
                await Get.find<ProductController>().filterProduct(value);
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GetBuilder<ProductController>(
                builder: (productController) {
                  return productController.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : productController.products.isNotEmpty
                          ? MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                itemCount: productController.products.length,
                                itemBuilder: (context, index) {
                                  return SwipeActionCell(
                                    key: ObjectKey(
                                      productController.products[index],
                                    ),
                                    trailingActions: <SwipeAction>[
                                      SwipeAction(
                                        widthSpace: 120,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        content: Container(
                                          height: 120,
                                          width: 120,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Color(0xff00C569),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap:
                                            (CompletionHandler handler) async {
                                          await handler(true);
                                          Get.find<CartController>().addToCart(
                                              productController
                                                  .products[index]);
                                          productController
                                              .removeProduct(index);
                                        },
                                      ),
                                    ],
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 120,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                            child: Image.network(
                                                productController
                                                    .products[index].image!),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 120,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 10),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 6,
                                                    ),
                                                    child: Text(
                                                      productController
                                                          .products[index]
                                                          .name!,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style:
                                                          kProductStyle(size),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.05),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        productController
                                                            .products[index]
                                                            .price
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                kProductStyle(
                                                                        size)
                                                                    .fontSize,
                                                            color: Colors.red),
                                                      ),
                                                      Text(
                                                        saledName +
                                                            productController
                                                                .products[index]
                                                                .inventory
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontSize:
                                                              kProductStyle(
                                                                      size)
                                                                  .fontSize,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Empty',
                                style: TextStyle(fontSize: 24),
                              ),
                            );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
