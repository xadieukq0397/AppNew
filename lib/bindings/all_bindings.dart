import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/address_controller.dart';
import 'package:responsive_login_ui/controller/auth_controller.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/controller/checkout_controller.dart';
import 'package:responsive_login_ui/controller/order_controller.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import 'package:responsive_login_ui/data/repository/address_repo.dart';
import 'package:responsive_login_ui/data/repository/cart_repo.dart';
import 'package:responsive_login_ui/data/repository/order_repo.dart';
import 'package:responsive_login_ui/data/repository/product_repo.dart';

import '../data/provider/api/api.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Api());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => AddressRepo(api: Get.find()));
    Get.lazyPut(() => AddressController(addressRepo: Get.find()));
    Get.lazyPut(() => ProductRepo());
    Get.lazyPut(() => ProductController(productRepo: Get.find()));
    Get.lazyPut(() => CartRepo());
    Get.lazyPut(() => CartController(cartRepo: Get.find()));
    Get.lazyPut(() => Orderrepo());
    Get.lazyPut(() => OrderController(orderRepo: Get.find()));
    Get.lazyPut(() => CheckOutController());
  }
}
