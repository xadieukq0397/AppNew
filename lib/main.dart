import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import 'package:responsive_login_ui/l10n/l10n.dart';
import 'package:responsive_login_ui/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bindings/start_bindings.dart' as start_bindings;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  start_bindings.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: L10n.all,
        initialRoute: Routes.getLoginPage(),
        getPages: Routes.listRoutes,
      ),
    );
  }
}
