import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/features/branch_menu/models/menu_category.dart';
import 'package:resto_chain_app/features/branch_menu/models/menu_item_model.dart';
import 'package:resto_chain_app/features/branch_menu/services/branch_menu_service.dart';
import 'package:resto_chain_app/features/branches/data/models/branche_model.dart';

class BranchMenuController extends GetxController {
  final BranchModel branchModel;

  BranchMenuController(this.branchModel);

  final BranchMenuService _service = BranchMenuService();

  final categories = <MenuCategory>[].obs;
  final items = <MenuItemModel>[].obs;

  final selectedCategoryId = RxnString();

  final categoriesState = ViewState.loading.obs;
  final itemsState = ViewState.loading.obs;
  final errorMessage = RxnString();

  final Map<String, List<MenuItemModel>> _itemsCache = {};

  late String branchId;
  late String currentRestaurantId;

  @override
  void onInit() {
    super.onInit();
    branchId = branchModel.id;
    currentRestaurantId = branchModel.restaurantId;

    loadCategories();
  }

  Future<void> loadCategories() async {
    categoriesState.value = ViewState.loading;

    try {
      final result = await _service.getCategories(branchId: branchId);

      categories.value = result;

      if (result.isEmpty) {
        categoriesState.value = ViewState.empty;
        itemsState.value = ViewState.empty;
        return;
      }

      categoriesState.value = ViewState.success;

      await selectCategory(result.first.id);
    } catch (e) {
      errorMessage.value = e.toString();
      categoriesState.value = ViewState.error;
    }
  }

  Future<void> selectCategory(String categoryId) async {
    selectedCategoryId.value = categoryId;

    // ✅ if cached → no request
    if (_itemsCache.containsKey(categoryId)) {
      items.value = _itemsCache[categoryId]!;
      itemsState.value = items.isEmpty ? ViewState.empty : ViewState.success;
      return;
    }

    itemsState.value = ViewState.loading;

    try {
      final result = await _service.getItemsByCategory(
        branchId: branchId,
        categoryId: categoryId,
      );

      _itemsCache[categoryId] = result;
      items.value = result;

      itemsState.value = result.isEmpty ? ViewState.empty : ViewState.success;
    } catch (e) {
      errorMessage.value = e.toString();
      itemsState.value = ViewState.error;
    }
  }

  Future<void> refreshCurrentCategory() async {
    final categoryId = selectedCategoryId.value;
    if (categoryId == null) return;

    // remove from cache to force reload
    _itemsCache.remove(categoryId);

    await selectCategory(categoryId);
  }

  // Future<void> refreshData() async {
  //   if (selectedCategoryId.value != null) {
  //     await loadItems(selectedCategoryId.value!);
  //   }
  // }
}
