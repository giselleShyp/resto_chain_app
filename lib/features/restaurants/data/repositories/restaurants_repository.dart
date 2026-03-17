import 'package:resto_chain_app/features/restaurants/data/models/restaurant_model.dart';
import 'package:resto_chain_app/features/restaurants/data/services/restaurants_service.dart';

class RestaurantsRepository {
  final RestaurantsService service;

  RestaurantsRepository(this.service);

  Stream<List<RestaurantModel>> getRestaurantsRepo() {
    return service.getRestaurants();
  }
}
