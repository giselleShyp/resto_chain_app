import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/menu_item_card.dart';

class BranchMenuScreen extends StatelessWidget {
  const BranchMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 250, 249, 1),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildAppBar(),
            _buildCategoriesHeader(),
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.md),
                child: MenuItemCard(
                  name: "Brownie Sundae",
                  description:
                      "Warm brownie, vanilla ice cream with chocolate sauce",
                  imageUrl:
                      "https://stories.freepiklabs.com/storage/52060/hamburger-amico-4792.png",
                  price: 7.99,
                  onAdd: () {},
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

SliverAppBar _buildAppBar() {
  return SliverAppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    pinned: true,
    title: const Text("Pasta Palace"),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: AppSpacing.md),
        child: Badge(
          label: AppText(
            "11",
            contentColor: AppColors.onPrimary,
            contentStyle: ContentStyle.labelSmall,
          ),
          child: const Icon(CupertinoIcons.cart),
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

SliverPersistentHeader _buildCategoriesHeader() {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _CategoryHeaderDelegate(),
  );
}

class _CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _CategoryChip(title: "Burgers", isSelected: false),
          Gaps.w8,
          _CategoryChip(title: "Sides", isSelected: false),
          Gaps.w8,
          _CategoryChip(title: "Drinks", isSelected: false),
          Gaps.w8,
          _CategoryChip(title: "Desserts", isSelected: true),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
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
