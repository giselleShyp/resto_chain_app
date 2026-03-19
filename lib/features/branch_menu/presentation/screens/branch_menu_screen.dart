import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/widgets/animated_grid_view/animated_grid_view.dart';
import 'package:resto_chain_app/core/widgets/dialog/show_switch_cart_dialog.dart';
import 'package:resto_chain_app/features/branch_menu/data/models/menu_item_model.dart';
import 'package:resto_chain_app/features/cart/presentation/controllers/cart_controller.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/controllers/branch_menu_controller.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/widgets/header/menu_item_app_bar.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/widgets/header/menu_item_categories.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/widgets/menu_item_card.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/widgets/menu_item_states/menu_item_empty_state.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/widgets/menu_item_states/menu_item_error_state.dart';
import 'package:resto_chain_app/features/branch_menu/presentation/widgets/menu_item_states/menu_item_loading_state.dart';

class BranchMenuScreen extends GetView<BranchMenuController> {
  const BranchMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            MenuItemAppBar(title: controller.branchModel.branchName),
            Obx(() {
              if (controller.categoriesState.value == ViewState.success &&
                  controller.categories.isNotEmpty) {
                return MenuItemCategories(
                  categories: controller.categories,
                  selectedId: controller.selectedCategoryId.value,
                  onTap: controller.selectCategory,
                );
              }

              return const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }),
          ];
        },
        body: Obx(
          () {
            switch (controller.itemsState.value) {
              case ViewState.loading:
                return const MenuItemLoadingState();

              case ViewState.error:
                return MenuItemErrorState(
                  message: "Something went wrong",
                  onTap: controller.refreshCurrentCategory,
                );

              case ViewState.empty:
                return MenuItemEmptyState(message: "No items found");

              case ViewState.success:
                return Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: AnimationLimiter(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) {
                        final item = controller.items[index];

                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSpacing.md),
                          child: AnimatedGridView(
                            position: index,
                            verticalOffset: 50.0,
                            child: MenuItemCard(
                              name: item.name,
                              description: item.description,
                              imageUrl: item.imageUrl,
                              price: item.price,
                              onAdd: () {
                                addItemToCart(
                                  context: context,
                                  item: item,
                                  branchId: item.branchId,
                                  restaurantId: item.restaurantId,
                                  branchName: controller.branchModel.branchName,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

Future<void> addItemToCart({
  required BuildContext context,
  required MenuItemModel item,
  required String branchId,
  required String restaurantId,
  required String branchName,
}) async {
  final cartController = Get.find<CartController>();

  debugPrint("Screen branchId: $branchId");
  debugPrint("Screen restaurantId :$restaurantId");

  if (!item.isAvailable) {
    return;
  }

  final canAdd = cartController.canAddItem(
    branchId: branchId,
    restaurantId: restaurantId,
  );

  if (canAdd) {
    cartController.addItem(
      item: item,
      branchId: branchId,
      restaurantId: restaurantId,
      branchName: branchName,
    );
    return;
  }

  final confirm = await showSwitchCartDialog(context);

  if (confirm == true) {
    cartController.clearAll();
    cartController.addItem(
      item: item,
      branchId: branchId,
      restaurantId: restaurantId,
      branchName: branchName,
    );
  }
}
