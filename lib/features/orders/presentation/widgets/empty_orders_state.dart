import 'package:flutter/cupertino.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class EmptyOrdersState extends StatelessWidget {
  const EmptyOrdersState({
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.square_favorites,
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
