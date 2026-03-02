import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/cart_controller.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/features/branch_menu/controllers/branch_menu_controller.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/header/menu_item_app_bar.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/header/menu_item_categories.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/menu_item_card.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/menu_item_states/menu_item_empty_state.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/menu_item_states/menu_item_error_state.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/menu_item_states/menu_item_loading_state.dart';

class BranchMenuScreen extends GetView<BranchMenuController> {
  const BranchMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 250, 249, 1),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            MenuItemAppBar(title: controller.branch.branchName),
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
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      final item = controller.items[index];

                      return Padding(
                        padding: EdgeInsets.only(bottom: AppSpacing.md),
                        child: MenuItemCard(
                          name: item.name,
                          description: item.description,
                          imageUrl: item.imageUrl,
                          price: item.price,
                          onAdd: () {
                            final cart = Get.find<CartController>();

                            if (!item.isAvailable) {
                              return;
                            }
                            cart.addItem(item);
                          },
                        ),
                      );
                    },
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
