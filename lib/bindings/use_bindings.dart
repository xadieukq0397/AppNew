import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/data/repository/cart_repo.dart';
import '../controller/controller_view_controller.dart';
import '../controller/order_controller.dart';
import '../data/repository/order_repo.dart';

void dependencies() {
  Get.lazyPut(() => CartRepo(), fenix: true);
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => OrderRepo(apiGHTK: Get.find()), fenix: true);
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
  Get.lazyPut(() => ControlViewController());
}
