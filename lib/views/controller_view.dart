import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/controller_view_controller.dart';
import '../config/ui_constants.dart';
import 'package:responsive_login_ui/bindings/use_bindings.dart' as use_bindings;

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    use_bindings.dependencies();
    return Scaffold(
      body: GetBuilder<ControlViewController>(
        builder: (controlViewController) => controlViewController.currentScreen,
      ),
      bottomNavigationBar: GetBuilder<ControlViewController>(
        builder: (controlViewController) => DefaultTabController(
          initialIndex: controlViewController.navigatorValue,
          length: 4,
          child: TabBar(
            tabs: const [
              Tab(
                child: Icon(
                  Icons.home_outlined,
                  color: activeCyanColor,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: activeCyanColor,
                ),
              ),
              Tab(
                  child: Icon(
                Icons.archive_outlined,
                color: activeCyanColor,
              )),
              Tab(
                child: Icon(
                  Icons.account_circle_outlined,
                  color: activeCyanColor,
                ),
              ),
            ],
            onTap: (value) {
              controlViewController.changeScreen(value);
            },
          ),
        ),
      ),
    );
  }
}
