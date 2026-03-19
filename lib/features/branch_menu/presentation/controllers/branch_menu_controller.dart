import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/errors/handle_firebase_error.dart';
import 'package:resto_chain_app/features/branch_menu/data/models/menu_category.dart';
import 'package:resto_chain_app/features/branch_menu/data/models/menu_item_model.dart';
import 'package:resto_chain_app/features/branch_menu/data/repositories/branch_menu_repository.dart';
import 'package:resto_chain_app/features/branches/data/models/branche_model.dart';

class BranchMenuController extends GetxController {
  final BranchMenuRepository branchesMenuRepository;

  final BranchModel branchModel;

  BranchMenuController(this.branchModel, this.branchesMenuRepository);

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
    try {
      categoriesState.value = ViewState.loading;
      errorMessage.value = null;

      final result =
          await branchesMenuRepository.getCategories(branchId: branchId);

      if (result.isEmpty) {
        categoriesState.value = ViewState.empty;
        itemsState.value = ViewState.empty;
        return;
      }

      categories.assignAll(result);
      categoriesState.value = ViewState.success;

      // Automatically select the first category
      await selectCategory(result.first.id);
    } catch (e) {
      errorMessage.value = handleFirebaseError(e);
      categoriesState.value = ViewState.error;
    }
  }

  Future<void> selectCategory(String categoryId) async {
    selectedCategoryId.value = categoryId;

    // ✅ if cached → no request
    if (_itemsCache.containsKey(categoryId)) {
      items.assignAll(_itemsCache[categoryId]!);
      itemsState.value = items.isEmpty ? ViewState.empty : ViewState.success;
      return;
    }

    // 2. Fetch from Remote
    try {
      itemsState.value = ViewState.loading;

      final result = await branchesMenuRepository.getItemsByCategory(
        branchId: branchId,
        categoryId: categoryId,
      );

      _itemsCache[categoryId] = result;
      items.assignAll(result);

      itemsState.value = result.isEmpty ? ViewState.empty : ViewState.success;
    } catch (e) {
      errorMessage.value = handleFirebaseError(e);
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
}
