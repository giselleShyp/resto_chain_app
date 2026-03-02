import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/bottom_nav_controller.dart';
import 'package:resto_chain_app/core/controllers/cart_controller.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/branch_menu/controllers/branch_menu_controller.dart';
import 'package:resto_chain_app/features/branch_menu/models/menu_category.dart';
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
            _buildAppBar(controller: controller),
            Obx(() {
              if (controller.categoriesState.value == ViewState.success &&
                  controller.categories.isNotEmpty) {
                return _buildCategoriesHeader(controller);
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

SliverAppBar _buildAppBar({required BranchMenuController controller}) {
  final cart = Get.find<CartController>();

  return SliverAppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    pinned: true,
    title: AppText(
      controller.branch.branchName,
      contentStyle: ContentStyle.titleLarge,
      fontWeight: FontWeight.w500,
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: AppSpacing.md),
        child: Obx(
          () => InkWell(
            onTap: () {
              final nav = Get.find<BottomNavController>();
              nav.changeIndex(2);

              Get.offAllNamed(AppRoutes.base);
            },
            child: Badge(
              label: AppText(
                cart.cartCount.toString(),
                contentColor: AppColors.onPrimary,
                contentStyle: ContentStyle.labelSmall,
              ),
              child: const Icon(CupertinoIcons.cart),
            ),
          ),
        ),
      )
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        height: 1,
        color: Colors.grey.withValues(alpha: 0.2),
      ),
    ),
  );
}

SliverPersistentHeader _buildCategoriesHeader(BranchMenuController controller) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _CategoryHeaderDelegate(
      categories: controller.categories,
      selectedId: controller.selectedCategoryId.value,
      onTap: controller.selectCategory,
    ),
  );
}

class _CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<MenuCategory> categories;
  final String? selectedId;
  final Function(String) onTap;

  _CategoryHeaderDelegate({
    required this.categories,
    required this.selectedId,
    required this.onTap,
  });

  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 60;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => Gaps.w8,
        itemBuilder: (context, index) {
          final category = categories[index];

          final isSelected = selectedId == category.id;

          return GestureDetector(
            onTap: () => onTap(category.id),
            child: _CategoryChip(
              title: category.name,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _CategoryHeaderDelegate oldDelegate) {
    return oldDelegate.selectedId != selectedId ||
        oldDelegate.categories != categories;
  }
}

class _CategoryChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _CategoryChip({
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.l),
      ),
      child: AppText(
        title,
        contentColor: isSelected ? Colors.white : AppColors.textSecondary,
        contentStyle: ContentStyle.bodyMedium,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
