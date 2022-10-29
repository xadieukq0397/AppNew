import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/l10n/l10n.dart';
import 'package:responsive_login_ui/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bindings/all_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: L10n.all,
      initialRoute: Routes.getOrdersHistory(),
      getPages: Routes.listRoutes,
      initialBinding: AllBindings(),
    );
  }
}
