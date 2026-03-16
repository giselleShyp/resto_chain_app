import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

Future<bool?> showClearCartDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const AppText(
          "Clear cart?",
          contentStyle: ContentStyle.titleMedium,
          fontWeight: FontWeight.w600,
        ),
        content: const AppText(
          "All items in your cart will be removed.",
          contentStyle: ContentStyle.bodyMedium,
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const AppText(
              "Cancel",
              contentStyle: ContentStyle.labelLarge,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const AppText(
              "Clear",
              contentStyle: ContentStyle.labelLarge,
              contentColor: Colors.white,
            ),
          ),
        ],
      );
    },
  );
}
