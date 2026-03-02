import 'package:get/get.dart';
import 'package:resto_chain_app/features/branch_menu/models/menu_item_model.dart';

class CartController extends GetxController {
  final cartItems = <MenuItemModel>[].obs;

  int get cartCount => cartItems.length;

  void addItem(MenuItemModel item) {
    cartItems.add(item);
  }
}
