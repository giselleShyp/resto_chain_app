import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/features/orders/models/order_model.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> setOrder(OrderModel order) async {
    try {
      await _firestore.collection("orders").doc(order.id).set(order.toMap());
    } catch (e, stackTrace) {
      debugPrint("🔥 Firestore Error: $e");
      debugPrint("🔥 StackTrace: $stackTrace");
      rethrow;
    }
  }
}
