import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:resto_chain_app/core/bindings/initial_binding.dart';
import 'package:resto_chain_app/core/routes/named_routes.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      builder: (context, child) {
        AppSpacing.init(context);
        final locale = Localizations.localeOf(context);

        return Theme(
          data: locale.languageCode == 'ar'
              ? AppTheme.arabicLightTheme
              : AppTheme.englishLightTheme,
          child: child!,
        );
      },
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.splash,
      getPages: routePages,
    );
  }
}
