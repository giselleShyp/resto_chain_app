import 'package:get/get.dart';
import 'package:resto_chain_app/core/layouts/main/base.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/features/splash/splash_screen.dart';

// Pair routes' names with the corresponding pages
List<GetPage<dynamic>> routePages = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.base,
    page: () => BaseScreen(),
    transition: Transition.fadeIn,
  ),
];
