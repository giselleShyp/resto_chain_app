import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/base_card.dart/base_card.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({
    super.key,
    required this.logoUrl,
    required this.restaurantName,
    required this.restaurantDescription,
    required this.index,
  });

  final String logoUrl;
  final String restaurantName;
  final String restaurantDescription;
  final int index;

  final List<Color> logoColors = [
    Colors.orange.withValues(alpha: 0.15),
    Colors.pink.withValues(alpha: 0.15),
    Colors.green.withValues(alpha: 0.15),
    Colors.blue.withValues(alpha: 0.15),
    Colors.purple.withValues(alpha: 0.15),
  ];

  @override
  Widget build(BuildContext context) {
    final randomColor = logoColors[index % logoColors.length];

    return BaseCard(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSpacing.xs,
            children: [
              RestaurantLogoContainer(
                imageUrl: logoUrl,
                backgroundColor: randomColor,
              ),
              Gaps.h2,
              AppText(
                restaurantName,
                contentStyle: ContentStyle.titleMedium,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              AppText(
                restaurantDescription,
                contentStyle: ContentStyle.labelMedium,
                contentColor: AppColors.textSecondary,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantLogoContainer extends StatelessWidget {
  final String imageUrl;
  final Color backgroundColor;

  const RestaurantLogoContainer({
    super.key,
    required this.imageUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: AppSpacing.sm.all,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.contain,
        width: 50,
        height: 50,
        placeholder: (context, url) =>
            Center(child: const CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
