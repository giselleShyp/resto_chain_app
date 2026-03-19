import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/features/branch_menu/data/models/menu_category.dart';
import 'package:resto_chain_app/features/branch_menu/data/models/menu_item_model.dart';

class BranchMenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MenuCategory>> getCategories({
    required String branchId,
  }) async {
    final snapshot = await _firestore
        .collection('branches')
        .doc(branchId)
        .collection('categories')
        .get();

    return snapshot.docs.map((doc) {
      try {
        return MenuCategory.fromMap(doc.id, doc.data());
      } catch (e) {
        debugPrint("❌ Category Map Error [ID: ${doc.id}]: $e");
        throw Exception("Invalid category data");
      }
    }).toList();
  }

  Future<List<MenuItemModel>> getItemsByCategory({
    required String branchId,
    required String categoryId,
  }) async {
    final snapshot = await _firestore
        .collection('branches')
        .doc(branchId)
        .collection('categories')
        .doc(categoryId)
        .collection('items')
        .get();

    return snapshot.docs.map((doc) {
      try {
        return MenuItemModel.fromMap(doc.id, doc.data());
      } catch (e) {
        debugPrint("❌ MenuItem Map Error [ID: ${doc.id}]: $e");
        throw Exception("Invalid item data");
      }
    }).toList();
  }
}
