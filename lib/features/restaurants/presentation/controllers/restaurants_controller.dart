import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/errors/handle_firebase_error.dart';
import 'package:resto_chain_app/features/restaurants/data/models/restaurant_model.dart';
import 'package:resto_chain_app/features/restaurants/data/repositories/restaurants_repository.dart';

class RestaurantsController extends GetxController {
  final RestaurantsRepository restaurantsRepository;

  RestaurantsController(this.restaurantsRepository);

  final restaurants = <RestaurantModel>[].obs;
  final state = ViewState.loading.obs;
  final errorMessage = RxnString();

  @override
  void onInit() {
    super.onInit();
    _listenToRestaurants();
  }

  void _listenToRestaurants() {
    state.value = ViewState.loading;
    errorMessage.value = null;

    final stream =
        restaurantsRepository.getRestaurantsRepo().handleError((error) {
      // Handle Firebase/Network errors here
      debugPrint("🔥 Stream Error: $error");
      errorMessage.value = handleFirebaseError(error);
      state.value = ViewState.error;
    });

    // bindStream automatically manages the subscription for you!
    restaurants.bindStream(
      stream.map(
        (data) {
          if (data.isEmpty) {
            state.value = ViewState.empty;
          } else {
            state.value = ViewState.success;
          }
          return data;
        },
      ),
    );
  }

  @override
  Future<void> refresh() async {
    state.value = ViewState.loading;
    await Future.delayed(const Duration(milliseconds: 300));

    _listenToRestaurants();
    super.refresh();
  }
}
