import 'dart:async';

import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/errors/handle_firebase_error.dart';
import 'package:resto_chain_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:resto_chain_app/features/orders/data/models/order_model.dart';
import 'package:resto_chain_app/features/orders/data/repositories/orders_repository.dart';

class OrdersController extends GetxController {
  final OrdersRepository ordersRepository;

  OrdersController(this.ordersRepository);

  final orders = <OrderModel>[].obs;
  final errorMessage = RxnString();
  final state = ViewState.loading.obs;

  final auth = Get.find<AuthController>();
  String userId = "";

  @override
  void onInit() {
    super.onInit();
    _initOrders();
  }

  void _initOrders() {
    state.value = ViewState.loading;
    errorMessage.value = null;

    final String uid = auth.currentUser.value?.uid ?? "";

    final stream = ordersRepository.getOrders(uid).handleError((error) {
      // Handle Firebase/Network errors here
      state.value = ViewState.error;
      errorMessage.value = handleFirebaseError(error);
    });

    // bindStream automatically manages the subscription for you!
    orders.bindStream(stream.map((data) {
      if (data.isEmpty) {
        state.value = ViewState.empty;
      } else {
        state.value = ViewState.success;
      }
      return data;
    }));
  }

  @override
  Future<void> refresh() async {
    // To trigger the animation from your video again, we flicker the state
    state.value = ViewState.loading;
    await Future.delayed(const Duration(milliseconds: 300));

    // Re-binding automatically replaces the old stream
    _initOrders();

    super.refresh();
  }
}
