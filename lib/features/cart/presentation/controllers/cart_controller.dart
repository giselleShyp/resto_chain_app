import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/errors/handle_firebase_error.dart';
import 'package:resto_chain_app/core/models/result_model.dart';
import 'package:resto_chain_app/features/branch_menu/data/models/menu_item_model.dart';
import 'package:resto_chain_app/features/cart/data/models/cart_item_model.dart';
import 'package:resto_chain_app/features/cart/data/repositories/cart_repository.dart';
import 'package:resto_chain_app/features/orders/data/enums/order_status_enum.dart';
import 'package:resto_chain_app/features/orders/data/models/order_item_model.dart';
import 'package:resto_chain_app/features/orders/data/models/order_model.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;

  CartController(this.cartRepository);

  final cartItems = <CartItemModel>[].obs;

  int get cartCount => cartItems.fold(0, (sum, e) => sum + e.quantity);

  double get totalPriceAll => cartItems.fold(0, (sum, e) => sum + e.totalPrice);

  var isLoading = false.obs;

  String? currentBranchId;
  String? currentRestaurantId;
  String? currentBranchName;

  bool canAddItem({
    required String branchId,
    required String restaurantId,
  }) {
    if (cartItems.isEmpty) return true;

    debugPrint("currentBranchId: $currentBranchId");
    debugPrint("currentRestaurantId :$currentRestaurantId");

    debugPrint("branchId: $branchId");
    debugPrint("restaurantId :$restaurantId");

    //Can't Add Item from another branch or restaurant
    if (currentBranchId != branchId || currentRestaurantId != restaurantId) {
      return false;
    }
    return true;
  }

  void addItem({
    required MenuItemModel item,
    String? branchName,
    String? branchId,
    String? restaurantId,
  }) {
    currentBranchId ??= branchId;
    currentRestaurantId ??= restaurantId;
    currentBranchName ??= branchName;

    // if (currentBranchId != branchId) {
    //   return ResultModel.failure(
    //     message: "Different branch",
    //   );
    // }

    final index = cartItems.indexWhere((e) => e.item.id == item.id);

    if (index != -1) {
      //Freq Item
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      //Item Not Found (New)
      cartItems.add(CartItemModel(item: item));
    }
  }

  void removeOne(String itemId) {
    final index = cartItems.indexWhere((e) => e.item.id == itemId);

    if (index == -1) return;

    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    } else {
      cartItems.removeAt(index);
    }
  }

  void deleteItem(String itemId) {
    cartItems.removeWhere((e) => e.item.id == itemId);
  }

  void clearAll() {
    cartItems.clear();
    currentBranchId = null;
    currentRestaurantId = null;
    currentBranchName = null;
  }

  Future<ResultModel> checkout({required String userId}) async {
    if (cartItems.isEmpty) {
      return ResultModel.failure(message: "Your cart is empty");
    }

    if (userId.isEmpty) {
      return ResultModel.failure(message: "Please login to place an order");
    }

    debugPrint("userId :$userId");

    final order = OrderModel(
      id: const Uuid().v4(),
      userId: userId,
      restaurantId: currentRestaurantId!,
      branchId: currentBranchId!,
      branchName: currentBranchName!,
      status: OrderStatus.preparing,
      totalPrice: totalPriceAll,
      createdAt: DateTime.now(),
      items: cartItems.map((e) {
        return OrderItemModel(
          name: e.item.name,
          price: e.item.price,
          quantity: e.quantity,
        );
      }).toList(),
    );
    try {
      isLoading.value = true;

      // 2. Remote Operation
      await cartRepository.addOrder(order);

      // 3. Success Logic
      clearAll();

      // isLoading.value = false;

      return ResultModel.success(
        message: "Order placed successfully!",
      );
    } catch (e) {
      // 4. Error Logic using your Global Helper
      final errorMsg = handleFirebaseError(e);
      debugPrint("❌ Checkout Failed: $e");
      return ResultModel.failure(message: errorMsg);
    } finally {
      // 5. Always stop loading regardless of success/failure
      isLoading.value = false;
    }
  }
}
