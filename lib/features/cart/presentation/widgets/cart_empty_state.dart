import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/bottom_nav_controller.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/buttons/app_button.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.sm,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(AppRadius.s),
              ),
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.grey,
              ),
            ),
            AppText(
              "Your cart is empty",
              contentStyle: ContentStyle.titleMedium,
              fontWeight: FontWeight.w600,
            ),
            AppText(
              "Browse restaurants and add items",
              contentStyle: ContentStyle.titleSmall,
              contentColor: AppColors.textSecondary,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
              child: AppButton(
                variation: ButtonVariation.primary,
                label: "Brows Restaurants",
                onPressed: () {
                  final mm = Get.find<BottomNavController>();
                  mm.changeIndex(0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
