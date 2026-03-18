import 'package:get/get.dart';
import 'package:resto_chain_app/features/auth/data/repositories/auth_repository.dart';
import 'package:resto_chain_app/features/auth/data/services/auth_service.dart';
import 'package:resto_chain_app/features/auth/presentation/controllers/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => AuthRepository(Get.find()));
    Get.put(AuthController(Get.find()), permanent: true);

    // Get.put(UserController(), permanent: true);
    // Get.put(BottomNavController());
    // Get.put(CartController(), permanent: true);
  }
}
