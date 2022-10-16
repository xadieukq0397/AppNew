import 'package:get/get.dart';
import 'package:responsive_login_ui/views/address_view.dart';
import 'package:responsive_login_ui/views/detail_view.dart';
import 'package:responsive_login_ui/views/home/home_view.dart';
import 'package:responsive_login_ui/views/login_view.dart';
import 'package:responsive_login_ui/views/signup_view.dart';

import '../data/model/product.dart';

class Routes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String country = '/country';
  static const String detail = '/detail';
  static const String home = '/home';
  static String getLoginPage() => '$login';
  static String getSignUpPage() => '$signUp';
  static String getCountryPage() => '$country';
  static String getDetailPage(String productId) => '$detail?productId';
  static String gethomePage() => '$home';
  static List<GetPage> listRoutes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: signUp, page: () => const SignUpView()),
    GetPage(name: country, page: () => const AddressView()),
    GetPage(
        name: detail,
        page: () {
          var product = Get.parameters['product'];
          return DetailView(productId: product);
        }),
    GetPage(name: home, page: () => const HomeView()),
  ];
}
