import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/features/orders/data/models/order_model.dart';

class OrdersService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<OrderModel>> getOrdersByUser(String userId) {
    // Returning the stream directly is cleaner for bindStream
    return _firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        try {
          return OrderModel.fromMap(doc.id, doc.data());
        } catch (e) {
          debugPrint("❌ Order Mapping Error [ID: ${doc.id}]: $e");
          // We rethrow or return a 'null' and filter it out
          throw Exception("Failed to parse order data");
        }
      }).toList();
    });
  }
}
