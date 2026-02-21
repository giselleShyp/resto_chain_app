import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/features/restaurants/models/restaurant_model.dart';
import 'package:resto_chain_app/features/restaurants/services/restaurants_service.dart';

class RestaurantController extends GetxController {
  final RestaurantsService _service = RestaurantsService();

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

    _service.getRestaurants().listen(
      (data) {
        if (data.isEmpty) {
          state.value = ViewState.empty;
        } else {
          restaurants.value = data;
          state.value = ViewState.success;
        }
      },
      onError: (error) {
        errorMessage.value = error.toString();
        state.value = ViewState.error;
      },
    );
  }
}

// class RestaurantController extends GetxController {
//   final RestaurantsService _resService = RestaurantsService();

//   Stream<List<RestaurantModel>> getRestaurants() {
//     debugPrint("getRestaurants");
//     final result = _resService.getAllRestaurants();
//     return result;
//   }
// }
