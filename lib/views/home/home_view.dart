import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import 'package:responsive_login_ui/views/home/search_bar_widget.dart';
import '../../constants.dart';
import '../../routes/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SearchBarWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GetBuilder<ProductController>(
                builder: (productController) {
                  return productController.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: productController.products.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.getDetailPage(
                                    productController.products[index].id!));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white12,
                                    ),
                                    child: Image.network(productController
                                        .products[index].image!),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 110,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              padding: const EdgeInsets.only(
                                                  bottom: 6),
                                              child: Text(
                                                productController
                                                    .products[index].name!,
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: kProductStyle(size),
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.05),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  productController
                                                      .products[index].price
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          kProductStyle(size)
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
                                                            kProductStyle(size)
                                                                .fontSize,
                                                        color: Colors.grey))
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
                        );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: TabBar(
          tabs: const [
            Tab(
              child: Icon(
                Icons.home_outlined,
                color: activeCyanColor,
              ),
            ),
            Tab(
              child: Icon(
                Icons.account_circle_outlined,
                color: activeCyanColor,
              ),
            ),
            Tab(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: activeCyanColor,
              ),
            ),
            Tab(
              child: Icon(
                Icons.menu_outlined,
                color: activeCyanColor,
              ),
            )
          ],
          onTap: (value) {},
        ),
      ),
    );
  }
}
