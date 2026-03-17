import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/app_cached_network_image/app_cached_network_image.dart';
import 'package:resto_chain_app/core/widgets/base_card.dart/base_card.dart';
import 'package:resto_chain_app/core/widgets/opacity_container/opacity_container.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class MenuItemCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final VoidCallback onAdd;

  const MenuItemCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Padding(
        padding: AppSpacing.md.all,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _MenuImage(imageUrl: imageUrl),
            Gaps.w16,
            Expanded(
              child: _MenuInfo(
                name: name,
                description: description,
                price: price,
              ),
            ),
            Gaps.w16,
            _AddButton(onTap: onAdd),
          ],
        ),
      ),
    );
  }
}

class _MenuImage extends StatelessWidget {
  const _MenuImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return OpacityContainer(
      color: Colors.grey,
      child: AppCachedNetworkImage(
        imageUrl: imageUrl,
      ),
    );
  }
}

class _MenuInfo extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  const _MenuInfo({
    required this.name,
    required this.description,
    required this.price,
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
          description,
          contentStyle: ContentStyle.labelLarge,
          contentColor: AppColors.textSecondary,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Gaps.h4,
        AppText(
          "${price.toStringAsFixed(2)} \$",
          contentStyle: ContentStyle.bodyLarge,
          contentColor: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.md),
      onTap: onTap,
      child: OpacityContainer(
        color: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
