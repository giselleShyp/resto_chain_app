import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/features/restaurants/models/restaurant_model.dart';

class RestaurantsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<RestaurantModel>> getRestaurants() async* {
    try {
      final snapshots = _firestore.collection('restaurants').snapshots();

      await for (final snapshot in snapshots) {
        final restaurants = snapshot.docs
            .map((doc) => RestaurantModel.fromMap(doc.id, doc.data()))
            .toList();

        yield restaurants;
      }
    } catch (e, stackTrace) {
      debugPrint("🔥 Firestore Error: $e");
      debugPrint("🔥 StackTrace: $stackTrace");
      rethrow;
    }
  }
}

//   Stream<List<RestaurantModel>> getAllRestaurants() {
//     debugPrint("RestaurantsService :getRestaurants");
//     return _firestore
//         .collection('restaurants')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .map((snapshot) {
//       debugPrint("snapshot $snapshot");
//       return snapshot.docs
//           .map((doc) => RestaurantModel.fromMap(doc.id, doc.data()))
//           .toList();
//     });
//   }
// }
