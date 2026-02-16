import 'package:get/get.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/features/auth/binding/auth_binding.dart';
import 'package:resto_chain_app/features/auth/views/login_screen.dart';
import 'package:resto_chain_app/features/auth/views/register_screen.dart';
import 'package:resto_chain_app/features/home/views/home_screen.dart';
import 'package:resto_chain_app/features/splash/splash_screen.dart';

// Pair routes' names with the corresponding pages
List<GetPage<dynamic>> routePages = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
    binding: AuthBinding(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => RegisterScreen(),
    binding: AuthBinding(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => HomeScreen(),
    binding: AuthBinding(),
    transition: Transition.fadeIn,
  ),
];
