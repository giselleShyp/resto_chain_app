import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class MenuItemEmptyState extends StatelessWidget {
  const MenuItemEmptyState({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.my_library_books_outlined,
              color: AppColors.textSecondary,
              size: 40,
            ),
            Gaps.h12,
            AppText(
              message,
              contentStyle: ContentStyle.titleLarge,
              contentColor: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
