import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/features/branch_menu/models/menu_category.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/category_chip.dart';

class MenuItemCategories extends StatelessWidget {
  const MenuItemCategories({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onTap,
  });

  final List<MenuCategory> categories;
  final String? selectedId;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _CategoryHeaderDelegate(
        categories: categories,
        selectedId: selectedId,
        onTap: onTap,
      ),
    );
  }
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
            child: CategoryChip(
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
