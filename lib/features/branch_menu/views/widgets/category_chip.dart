import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

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
