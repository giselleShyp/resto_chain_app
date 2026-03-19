import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/features/restaurants/data/models/restaurant_model.dart';

class RestaurantsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<RestaurantModel>> getRestaurants() {
    return _firestore.collection('restaurants').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        try {
          return RestaurantModel.fromMap(doc.id, doc.data());
        } catch (e) {
          // This catches data mapping errors (e.g., a missing field in a specific doc)
          // without crashing the entire stream.
          debugPrint("❌ Mapping Error for doc ${doc.id}: $e");
          throw Exception("Data format error in restaurant list");
        }
      }).toList();
    });
  }
}
