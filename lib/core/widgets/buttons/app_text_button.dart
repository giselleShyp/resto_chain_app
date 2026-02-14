import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      child: AppText(
        text,
        contentColor: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
