import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

enum ButtonVariation {
  primary,
  primaryOutline,
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.variation,
    required this.label,
    required this.onPressed,
  });

  final ButtonVariation variation;
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.transparent;
    Color borderColor = Colors.transparent;
    Color contentColor = AppColors.onPrimary;

    switch (variation) {
      case ButtonVariation.primary:
        backgroundColor = Theme.of(context).colorScheme.primary;
        borderColor = Theme.of(context).colorScheme.primary;
        contentColor = AppColors.onPrimary;
        break;

      case ButtonVariation.primaryOutline:
        backgroundColor = Colors.transparent;
        borderColor = Theme.of(context).colorScheme.primary;
        contentColor = AppColors.primary;
        break;
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: AppSpacing.md.all,
          child: AppText(
            label,
            contentStyle: ContentStyle.labelLarge,
            contentColor: contentColor,
          ),
        ),
      ),
    );
  }
}
