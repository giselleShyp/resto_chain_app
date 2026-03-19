import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/features/branches/data/models/branche_model.dart';

class BranchesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BranchModel>> getBranchesByRestaurant({
    required String restaurantId,
  }) async {
    final snapshot = await _firestore
        .collection('branches')
        .where('restaurantId', isEqualTo: restaurantId)
        .get();

    return snapshot.docs.map((doc) {
      try {
        return BranchModel.fromFirestore(doc.id, doc.data());
      } catch (e) {
        debugPrint("❌ Branch Mapping Error [ID: ${doc.id}]: $e");
        throw Exception("Failed to parse branch data");
      }
    }).toList();
  }
}
