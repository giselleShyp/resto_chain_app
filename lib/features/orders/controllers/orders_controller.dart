import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/features/auth/controllers/auth_controller.dart';
import 'package:resto_chain_app/features/orders/models/order_model.dart';
import 'package:resto_chain_app/features/orders/services/orders_service.dart';

class OrdersController extends GetxController {
  final OrdersService _ordersService = OrdersService();

  final errorMessage = RxnString();
  final orders = <OrderModel>[].obs;
  final state = ViewState.loading.obs;

  final auth = Get.find<AuthController>();
  String userId = "";

  @override
  void onInit() {
    userId = auth.currentUser.value?.uid ?? "";
    debugPrint("Load orders for user :$userId ");
    _listenToUserOrders();
    super.onInit();
  }

  Future<void> _listenToUserOrders() async {
    state.value = ViewState.loading;

    try {
      _ordersService.getOrdersByUser(userId).listen(
        (data) {
          if (data.isEmpty) {
            state.value = ViewState.empty;
          } else {
            orders.value = data;
            state.value = ViewState.success;
          }
        },
        onError: (error) {
          errorMessage.value = error.toString();
          state.value = ViewState.error;
        },
      );
    } catch (e) {
      errorMessage.value = e.toString();
      state.value = ViewState.error;
    }

    state.value = orders.isEmpty ? ViewState.empty : ViewState.success;
  }

  @override
  Future<void> refresh() async {
    await _listenToUserOrders();
    super.refresh();
  }
}
