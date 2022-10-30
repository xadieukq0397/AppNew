import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import '../config/app_constants.dart';
import '../controller/auth_controller.dart';
import '../data/provider/api/api_ghtk.dart';
import '../data/repository/product_repo.dart';

void dependencies() {
  Get.lazyPut(() => ApiGHTK(baseUrlGHTK: AppConstants.baseUrlGHTK));
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => ProductRepo());
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
}
