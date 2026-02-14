import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class AppLabelText extends StatelessWidget {
  const AppLabelText({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return AppText(
      label,
      contentStyle: ContentStyle.labelLarge,
      contentColor: AppColors.textSecondary,
    );
  }
}
