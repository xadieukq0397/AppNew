import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/controller/checkout_controller.dart';
import 'package:responsive_login_ui/controller/orders_history_controller.dart';
import 'package:responsive_login_ui/data/repository/cart_repo.dart';
import '../controller/address_controller.dart';
import '../controller/controller_view_controller.dart';
import '../controller/order_controller.dart';
import '../data/repository/address_repo.dart';
import '../data/repository/order_repo.dart';

void dependencies() {
  Get.lazyPut(() => CartRepo(), fenix: true);
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => CheckOutController());
  Get.lazyPut(() => OrdersHistoryController());
  Get.lazyPut(() => OrderRepo(apiGHTK: Get.find()), fenix: true);
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
  Get.lazyPut(() => ControlViewController());
  Get.lazyPut(() => AddressRepo(), fenix: true);
  Get.lazyPut(() => AddressController(addressRepo: Get.find()));
}
