import 'package:get/get.dart';
import 'package:resto_chain_app/features/branch_menu/models/menu_item_model.dart';
import 'package:resto_chain_app/features/cart/models/cart_item_model.dart';

class CartController extends GetxController {
  final cartItems = <CartItemModel>[].obs;

  int get cartCount => cartItems.fold(0, (sum, e) => sum + e.quantity);

  double get totalPriceAll => cartItems.fold(0, (sum, e) => sum + e.totalPrice);

  void addItem(MenuItemModel item) {
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
  }
}
