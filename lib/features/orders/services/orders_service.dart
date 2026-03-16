import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/features/orders/models/order_model.dart';

class OrdersService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<OrderModel>> getOrdersByUser(String userId) async* {
    try {
      final snapshots = _firestore
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .snapshots();

      await for (final snapshot in snapshots) {
        final userOrders = snapshot.docs
            .map((doc) => OrderModel.fromMap(doc.id, doc.data()))
            .toList();

        yield userOrders;
      }
    } catch (e, stackTrace) {
      debugPrint("🔥 Firestore Error: $e");
      debugPrint("🔥 StackTrace: $stackTrace");
      rethrow;
    }
  }
}
