import 'package:get/get.dart';
import 'package:resto_chain_app/features/branch_menu/data/repositories/branch_menu_repository.dart';
import 'package:resto_chain_app/features/branch_menu/data/services/branch_menu_service.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/controllers/branch_menu_controller.dart';
import 'package:resto_chain_app/features/branches/data/models/branche_model.dart';

class BranchMenuBinding extends Bindings {
  @override
  void dependencies() {
    final branch = Get.arguments as BranchModel;

    Get.lazyPut(() => BranchMenuService());
    Get.lazyPut(() => BranchMenuRepository(Get.find()));

    Get.lazyPut<BranchMenuController>(
        () => BranchMenuController(branch, Get.find()));
  }
}
