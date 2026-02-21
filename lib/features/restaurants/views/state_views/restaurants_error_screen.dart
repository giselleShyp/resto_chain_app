import 'package:flutter/cupertino.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class RestaurantsErrorScreen extends StatelessWidget {
  const RestaurantsErrorScreen({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        message,
        contentStyle: ContentStyle.titleLarge,
        contentColor: AppColors.error,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
