import 'package:get/get.dart';
import 'package:resto_chain_app/features/branches/controllers/branches_controller.dart';
import 'package:resto_chain_app/features/restaurants/data/models/restaurant_model.dart';

class BranchesBinding extends Bindings {
  @override
  void dependencies() {
    final restaurant = Get.arguments as RestaurantModel;

    Get.lazyPut<BranchesController>(() => BranchesController(restaurant));
  }
}
