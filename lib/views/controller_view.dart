import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/controller_view_controller.dart';
import '../config/ui_constants.dart';
import '../controller/cart_controller.dart';
import '../controller/product_controller.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().readAllCartFromDB();
    Get.find<ProductController>().readAllProductFromDB();
    return Scaffold(
      body: GetBuilder<ControlViewController>(
        init: ControlViewController(),
        builder: (controlViewController) {
          return controlViewController.currentScreen;
        },
      ),
      bottomNavigationBar: GetBuilder<ControlViewController>(
        builder: (controlViewController) => DefaultTabController(
          initialIndex: controlViewController.navigatorValue,
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
                  Icons.shopping_cart_outlined,
                  color: activeCyanColor,
                ),
              ),
              Tab(
                  child: Icon(
                Icons.archive_outlined,
                color: activeCyanColor,
              )),
              Tab(
                child: Icon(
                  Icons.account_circle_outlined,
                  color: activeCyanColor,
                ),
              ),
            ],
            onTap: (value) {
              controlViewController.changeScreen(value);
            },
          ),
        ),
      ),
    );
  }
}
