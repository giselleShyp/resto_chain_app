import 'package:get/get.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/features/auth/login/views/login_screen.dart';
import 'package:resto_chain_app/features/auth/register/views/register_screen.dart';
import 'package:resto_chain_app/features/splash/splash_screen.dart';

// Pair routes' names with the corresponding pages
List<GetPage<dynamic>> routePages = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => RegisterScreen(),
  ),
];
