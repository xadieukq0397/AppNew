import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/views/order/orders_view.dart';
import '../views/cart_view.dart';
import '../views/home_view.dart';
import '../views/profile_view.dart';

class ControlViewController extends GetxController {
  int _navigatorValue = 0;
  int get navigatorValue => _navigatorValue;
  Widget _currentScreen = const HomeView();
  Widget get currentScreen => _currentScreen;
  void changeScreen(int selectvalue) async {
    _navigatorValue = selectvalue;
    switch (_navigatorValue) {
      case 0:
        _currentScreen = const HomeView();
        break;
      case 1:
        _currentScreen = const CartView();
        break;
      case 2:
        _currentScreen = const OrderView();
        break;
      case 3:
        _currentScreen = const ProfileView();
        break;
    }
    update();
  }
}
