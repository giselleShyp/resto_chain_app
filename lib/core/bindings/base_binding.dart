import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/bottom_nav_controller.dart';
import 'package:resto_chain_app/features/cart/data/repositories/cart_repository.dart';
import 'package:resto_chain_app/features/cart/data/services/cart_service.dart';
import 'package:resto_chain_app/features/cart/presentation/controllers/cart_controller.dart';
import 'package:resto_chain_app/features/orders/data/repositories/orders_repository.dart';
import 'package:resto_chain_app/features/orders/data/services/orders_service.dart';
import 'package:resto_chain_app/features/orders/presentation/controllers/orders_controller.dart';
import 'package:resto_chain_app/features/restaurants/data/repositories/restaurants_repository.dart';
import 'package:resto_chain_app/features/restaurants/data/services/restaurants_service.dart';
import 'package:resto_chain_app/features/restaurants/presentation/controllers/restaurants_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);

    //Cart
    Get.lazyPut(() => CartService());
    Get.lazyPut(() => CartRepository(Get.find()));
    Get.put(CartController(Get.find()), permanent: true);

    //Restaurant
    Get.lazyPut(() => RestaurantsService());
    Get.lazyPut(() => RestaurantsRepository(Get.find()));
    Get.lazyPut(() => RestaurantsController(Get.find()));

    // Orders
    Get.lazyPut(() => OrdersService());
    Get.lazyPut(() => OrdersRepository(Get.find()));
    Get.lazyPut(() => OrdersController(Get.find()));
  }
}
