import 'package:get/get.dart';
import 'package:resto_chain_app/core/bindings/base_binding.dart';
import 'package:resto_chain_app/core/layouts/main/base.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/features/auth/presentation/screens/login_screen.dart';
import 'package:resto_chain_app/features/auth/presentation/screens/register_screen.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/binding/branch_menu_binding.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/screens/branch_menu_screen.dart';
import 'package:resto_chain_app/features/branches/presentation/binding/branches_binding.dart';
import 'package:resto_chain_app/features/branches/presentation/screens/branches_screen.dart';
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
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => const RegisterScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.base,
    page: () => BaseScreen(),
    binding: BaseBinding(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.branches,
    page: () => BranchesScreen(),
    binding: BranchesBinding(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.branchMenu,
    page: () => BranchMenuScreen(),
    binding: BranchMenuBinding(),
    transition: Transition.fadeIn,
  ),
];
