import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/bottom_nav_controller.dart';
import 'package:resto_chain_app/core/controllers/cart_controller.dart';
import 'package:resto_chain_app/features/auth/controllers/auth_controller.dart';
import 'package:resto_chain_app/features/profile/controllers/user_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(UserController(), permanent: true);
    Get.put(BottomNavController());
    Get.put(CartController(), permanent: true);
  }
}
