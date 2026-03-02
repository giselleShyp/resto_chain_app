import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/features/branches/models/branche_model.dart';
import 'package:resto_chain_app/features/branches/services/branches_service.dart';
import 'package:resto_chain_app/features/restaurants/models/restaurant_model.dart';

class BranchesController extends GetxController {
  final RestaurantModel restaurant;

  BranchesController(this.restaurant);

  final BranchesService _service = BranchesService();

  final branches = <BranchModel>[].obs;
  final state = ViewState.loading.obs;
  final errorMessage = RxnString();

  late final String _restaurantId;

  @override
  void onInit() {
    super.onInit();
    _restaurantId = restaurant.id;

    fetchBranches();
  }

  Future<void> fetchBranches() async {
    state.value = ViewState.loading;

    try {
      final result =
          await _service.getBranchesByRestaurant(restaurantId: _restaurantId);

      if (result.isEmpty) {
        state.value = ViewState.empty;
      } else {
        //branches.value = result;
        branches.assignAll(result);
        state.value = ViewState.success;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      state.value = ViewState.error;
    }
  }

  @override
  Future<void> refresh() async {
    await fetchBranches();
    super.refresh();
  }
}
