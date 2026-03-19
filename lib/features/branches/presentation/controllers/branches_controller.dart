import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/errors/handle_firebase_error.dart';
import 'package:resto_chain_app/features/branches/data/models/branche_model.dart';
import 'package:resto_chain_app/features/branches/data/repositories/branches_repository.dart';
import 'package:resto_chain_app/features/restaurants/data/models/restaurant_model.dart';

class BranchesController extends GetxController {
  final BranchesRepository branchesRepository;

  final RestaurantModel restaurant;

  BranchesController(this.restaurant, this.branchesRepository);

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
      final result = await branchesRepository.getBranchesByRestaurant(
          restaurantId: _restaurantId);

      if (result.isEmpty) {
        state.value = ViewState.empty;
      } else {
        //branches.value = result;
        branches.assignAll(result);
        state.value = ViewState.success;
      }
    } catch (e) {
      debugPrint("🔥 Fetch Branches Error: $e");
      // Use your Global Utility here
      errorMessage.value = handleFirebaseError(e);
      state.value = ViewState.error;
    }
  }

  @override
  Future<void> refresh() async {
    state.value = ViewState.loading;
    await Future.delayed(const Duration(milliseconds: 300));
    await fetchBranches();
    super.refresh();
  }
}
