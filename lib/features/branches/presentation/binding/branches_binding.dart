import 'package:get/get.dart';
import 'package:resto_chain_app/features/branches/data/repositories/branches_repository.dart';
import 'package:resto_chain_app/features/branches/data/services/branches_service.dart';
import 'package:resto_chain_app/features/branches/presentation/controllers/branches_controller.dart';
import 'package:resto_chain_app/features/restaurants/data/models/restaurant_model.dart';

class BranchesBinding extends Bindings {
  @override
  void dependencies() {
    final restaurant = Get.arguments as RestaurantModel;

    Get.lazyPut(() => BranchesService());
    Get.lazyPut(() => BranchesRepository(Get.find()));

    Get.lazyPut<BranchesController>(
        () => BranchesController(restaurant, Get.find()));
  }
}
