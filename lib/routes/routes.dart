import 'package:get/get.dart';
import 'package:responsive_login_ui/views/address_view.dart';
import 'package:responsive_login_ui/views/cart_view.dart';
import 'package:responsive_login_ui/views/check_out/select_transport_view.dart';
import 'package:responsive_login_ui/views/home_view.dart';
import 'package:responsive_login_ui/views/login_view.dart';
import 'package:responsive_login_ui/views/signup_view.dart';
import 'package:responsive_login_ui/views/controller_view.dart';

import '../views/check_out/address_checkout_view.dart';

class Routes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String address = '/address';
  static const String home = '/home';
  static const String control = '/control';
  static const String cart = '/cart';
  static const String transport = '/transport';
  static const String delivery = '/delivery';
  static String getLoginPage() => '$login';
  static String getSignUpPage() => '$signUp';
  static String getAddressPage() => '$address';
  static String gethomePage() => '$home';
  static String getControlViewPage() => '$control';
  static String getCartViewPage() => '$cart';
  static String getSelectTransportPage() => '$transport';
  static String getSelectDeliveryPage() => '$delivery';
  static List<GetPage> listRoutes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: signUp, page: () => const SignUpView()),
    GetPage(name: control, page: () => const ControlView()),
    GetPage(name: address, page: () => const AddressView()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: cart, page: () => const CartView()),
    GetPage(name: transport, page: () => const SelectTransport()),
    GetPage(name: delivery, page: () => const AddressCheckOut()),
  ];
}
