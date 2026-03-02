import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_chain_app/features/branch_menu/models/menu_category.dart';
import 'package:resto_chain_app/features/branch_menu/models/menu_item_model.dart';

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

    return snapshot.docs
        .map((doc) => MenuCategory.fromMap(doc.id, doc.data()))
        .toList();
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

    return snapshot.docs
        .map((doc) => MenuItemModel.fromMap(doc.id, doc.data()))
        .toList();
  }
}
