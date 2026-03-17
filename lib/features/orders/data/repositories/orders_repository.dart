import 'package:resto_chain_app/features/orders/data/models/order_model.dart';
import 'package:resto_chain_app/features/orders/data/services/orders_service.dart';

class OrdersRepository {
  final OrdersService service;

  OrdersRepository(this.service);

  Stream<List<OrderModel>> getOrders(String userId) {
    return service.getOrdersByUser(userId);
  }
}
