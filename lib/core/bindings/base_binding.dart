import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/bottom_nav_controller.dart';
import 'package:resto_chain_app/features/cart/controllers/cart_controller.dart';
import 'package:resto_chain_app/features/orders/controllers/orders_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(CartController(), permanent: true);

    Get.lazyPut(() => OrdersController());
  }
}
