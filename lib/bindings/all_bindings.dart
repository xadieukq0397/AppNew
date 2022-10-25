import 'package:get/get.dart';
import 'package:responsive_login_ui/config/app_constants.dart';
import 'package:responsive_login_ui/controller/address_controller.dart';
import 'package:responsive_login_ui/controller/auth_controller.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/controller/checkout_controller.dart';
import 'package:responsive_login_ui/controller/order_controller.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import 'package:responsive_login_ui/data/provider/api/api_ghtk.dart';
import 'package:responsive_login_ui/data/repository/address_repo.dart';
import 'package:responsive_login_ui/data/repository/cart_repo.dart';
import 'package:responsive_login_ui/data/repository/order_repo.dart';
import 'package:responsive_login_ui/data/repository/product_repo.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiGHTK(baseUrlGHTK: AppConstants.baseUrlGHTK));
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => AddressRepo());
    Get.lazyPut(() => AddressController(addressRepo: Get.find()));
    Get.lazyPut(() => ProductRepo());
    Get.lazyPut(() => ProductController(productRepo: Get.find()));
    Get.lazyPut(() => CartRepo());
    Get.lazyPut(() => CartController(cartRepo: Get.find()));
    Get.lazyPut(() => OrderRepo(apiGHTK: Get.find()));
    Get.lazyPut(() => OrderController(orderRepo: Get.find()));
    Get.lazyPut(() => CheckOutController());
  }
}
