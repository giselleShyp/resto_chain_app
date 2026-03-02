import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

Future<bool?> showSwitchCartDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const AppText(
          "Start a new order?",
          contentStyle: ContentStyle.titleMedium,
          fontWeight: FontWeight.w600,
        ),
        content: AppText(
          "Your cart contains items from another branch.\n\n"
          "If you continue, your current cart will be cleared.",
          contentStyle: ContentStyle.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const AppText(
              "Cancel",
              contentStyle: ContentStyle.labelLarge,
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const AppText(
              "Clear & Continue",
              contentStyle: ContentStyle.labelLarge,
              contentColor: Colors.red,
            ),
          ),
        ],
      );
    },
  );
}
