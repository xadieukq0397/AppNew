import 'package:get/get.dart';
import 'package:responsive_login_ui/views/address_view.dart';
import 'package:responsive_login_ui/views/detail_view.dart';
import 'package:responsive_login_ui/views/home/home_view.dart';
import 'package:responsive_login_ui/views/login_view.dart';
import 'package:responsive_login_ui/views/signup_view.dart';

class Routes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String country = '/country';
  static const String detail = '/detail';
  static const String home = '/home';
  static List<GetPage> listRoutes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: signUp, page: () => const SignUpView()),
    GetPage(name: country, page: () => const AddressView()),
    GetPage(name: detail, page: () => const DetailView()),
    GetPage(name: home, page: () => const HomeView()),
  ];
}
