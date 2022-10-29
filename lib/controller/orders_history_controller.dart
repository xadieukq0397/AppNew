import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersHistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<String> myTabs = <String>[
    'Temp Orders',
    'Created Orders',
    'Delivering Orders',
    'Delivered Orders'
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
