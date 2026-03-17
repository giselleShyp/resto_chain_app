import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/app_cached_network_image/app_cached_network_image.dart';
import 'package:resto_chain_app/core/widgets/base_card.dart/base_card.dart';
import 'package:resto_chain_app/core/widgets/opacity_container/opacity_container.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/branch_menu/data/models/menu_item_model.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
    required this.count,
    required this.totalPrice,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  final MenuItemModel item;
  final double totalPrice;
  final int count;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Padding(
        padding: AppSpacing.md.all,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OpacityContainer(
              color: Colors.grey,
              child: AppCachedNetworkImage(
                imageUrl: item.imageUrl,
              ),
            ),
            Gaps.w16,
            Expanded(
              child: _CartItemInfo(
                name: item.name,
                totalPrice: totalPrice,
              ),
            ),
            _CartItemActions(
              count: count,
              onAdd: onAdd,
              onRemove: onRemove,
              onDelete: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class _CartItemInfo extends StatelessWidget {
  final String name;
  final double totalPrice;

  const _CartItemInfo({
    required this.name,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          name,
          contentStyle: ContentStyle.bodyLarge,
          fontWeight: FontWeight.w600,
        ),
        Gaps.h4,
        AppText(
          "${totalPrice.toStringAsFixed(2)} \$",
          contentStyle: ContentStyle.bodyLarge,
          contentColor: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}

class _CartItemActions extends StatelessWidget {
  const _CartItemActions({
    required this.count,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  final int count;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.1),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.4)),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: onRemove,
                icon: Icon(
                  Icons.remove,
                  size: 20,
                ),
              ),
              AppText(
                count.toString(),
                contentStyle: ContentStyle.bodyLarge,
                fontWeight: FontWeight.w600,
              ),
              IconButton(
                onPressed: onAdd,
                icon: Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        Gaps.w2,
        IconButton(
          onPressed: onDelete,
          icon: Icon(
            CupertinoIcons.delete,
            color: AppColors.error,
            size: 20,
          ),
        ),
      ],
    );
  }
}
