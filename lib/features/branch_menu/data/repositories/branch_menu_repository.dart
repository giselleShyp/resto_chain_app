import 'package:resto_chain_app/features/branch_menu/data/models/menu_category.dart';
import 'package:resto_chain_app/features/branch_menu/data/models/menu_item_model.dart';
import 'package:resto_chain_app/features/branch_menu/data/services/branch_menu_service.dart';

class BranchMenuRepository {
  final BranchMenuService service;

  BranchMenuRepository(this.service);

  Future<List<MenuCategory>> getCategories({
    required String branchId,
  }) {
    return service.getCategories(branchId: branchId);
  }

  Future<List<MenuItemModel>> getItemsByCategory({
    required String branchId,
    required String categoryId,
  }) {
    return service.getItemsByCategory(
      branchId: branchId,
      categoryId: categoryId,
    );
  }
}
