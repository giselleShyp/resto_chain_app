import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_chain_app/features/orders/data/enums/order_status_enum.dart';
import 'package:resto_chain_app/features/orders/data/models/order_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final String restaurantId;
  final String branchId;
  final String branchName;
  final OrderStatus status;
  final double totalPrice;
  final DateTime createdAt;
  final List<OrderItemModel> items;

  OrderModel({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.branchId,
    required this.branchName,
    required this.status,
    required this.totalPrice,
    required this.items,
    required this.createdAt,
  });

  factory OrderModel.fromMap(String id, Map<String, dynamic> map) {
    return OrderModel(
      id: id,
      userId: map['userId'] ?? '',
      restaurantId: map['restaurantId'] ?? '',
      branchId: map['branchId'] ?? '',
      branchName: map['branchName'] ?? '',
      status: OrderStatus.fromCode(
        map['status'] is int
            ? map['status']
            : int.tryParse(map['status'].toString()) ?? 0,
      ),
      totalPrice: (map['totalPrice'] ?? 0).toDouble(),
      items: (map['items'] as List<dynamic>? ?? [])
          .map((e) => OrderItemModel.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'branchId': branchId,
      'restaurantId': restaurantId,
      'branchName': branchName,
      'status': status.code,
      'totalPrice': totalPrice,
      'items': items.map((e) => e.toMap()).toList(),
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
