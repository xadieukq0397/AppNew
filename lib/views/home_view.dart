import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import '../config/ui_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().readAllProductFromDB();
    var size = Get.size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 18, right: 18),
            child: GetBuilder<ProductController>(
              builder: (productController) => TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.textfieldSearch,
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
                  if (value.isEmpty) {
                    await productController.readAllProductFromDB();
                  }
                },
              ),
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
                                        performsFirstActionWithFullSwipe: true,
                                        widthSpace: 160,
                                        color: Colors.white,
                                        title: AppLocalizations.of(context)!
                                            .addToCartButton,
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 14),
                                        onTap:
                                            (CompletionHandler handler) async {
                                          bool isAdd =
                                              await Get.find<CartController>()
                                                  .addToCart(productController
                                                      .products[index]);
                                          if (isAdd) {
                                            await handler(true);
                                            productController
                                                .removeProduct(index);
                                          }
                                        },
                                      ),
                                    ],
                                    child: Row(
                                      children: [
                                        SizedBox(
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
                                            color: Colors.white,
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
                                                        AppLocalizations.of(
                                                                    context)!
                                                                .textInventory +
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
