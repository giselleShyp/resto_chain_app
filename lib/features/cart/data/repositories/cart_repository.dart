import 'package:resto_chain_app/features/cart/data/services/cart_service.dart';
import 'package:resto_chain_app/features/orders/data/models/order_model.dart';

class CartRepository {
  final CartService service;

  CartRepository(this.service);

  Future<void> addOrder(OrderModel order) {
    return service.setOrder(order);
  }
}
