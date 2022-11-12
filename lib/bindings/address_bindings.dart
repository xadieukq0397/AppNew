import 'package:get/get.dart';
import '../controller/address_controller.dart';
import '../data/repository/address_repo.dart';

void dependencies() {
  Get.lazyPut(() => AddressRepo(), fenix: true);
  Get.lazyPut(() => AddressController(addressRepo: Get.find()));
}
