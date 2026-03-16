import 'package:get/get.dart';
import 'package:resto_chain_app/features/auth/controllers/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    // Get.put(UserController(), permanent: true);
    // Get.put(BottomNavController());
    // Get.put(CartController(), permanent: true);
  }
}
