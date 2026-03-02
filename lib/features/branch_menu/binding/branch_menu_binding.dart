import 'package:get/get.dart';
import 'package:resto_chain_app/features/branch_menu/controllers/branch_menu_controller.dart';
import 'package:resto_chain_app/features/branches/models/branche_model.dart';

class BranchMenuBinding extends Bindings {
  @override
  void dependencies() {
    final branch = Get.arguments as BranchModel;

    Get.lazyPut<BranchMenuController>(() => BranchMenuController(branch));
  }
}
