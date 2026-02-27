import 'package:get/get.dart';
import 'package:resto_chain_app/features/branches/controllers/branches_controller.dart';

class BranchesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BranchesController>(() => BranchesController());
  }
}
