import 'package:flutter/cupertino.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class CategoryErrorState extends StatelessWidget {
  const CategoryErrorState({
    super.key,
    required this.message,
    required this.onTap,
  });

  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Center(
        child: Column(
          children: [
            AppText(
              message,
              contentStyle: ContentStyle.titleLarge,
              contentColor: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            Gaps.h12,
            GestureDetector(
              onTap: onTap,
              child: Icon(
                CupertinoIcons.arrow_counterclockwise,
                color: AppColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
