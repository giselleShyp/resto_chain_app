import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { success, error, info }

class AppSnackbar {
  AppSnackbar._();

  static void show(
    String message, {
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }

    Color backgroundColor;
    Icon icon;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = Colors.green.shade600;
        icon = const Icon(Icons.check_circle_outline, color: Colors.white);
        break;
      case SnackbarType.error:
        backgroundColor = Colors.red.shade600;
        icon = const Icon(Icons.error_outline, color: Colors.white);
        break;
      case SnackbarType.info:
      default:
        backgroundColor = Colors.blue.shade600;
        icon = const Icon(Icons.info_outline, color: Colors.white);
        break;
    }

    Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: duration,
      icon: icon,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
    );
  }

  static void success(String message,
      {Duration duration = const Duration(seconds: 2)}) {
    show(message, type: SnackbarType.success, duration: duration);
  }

  static void error(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    show(message, type: SnackbarType.error, duration: duration);
  }

  static void info(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    show(message, type: SnackbarType.info, duration: duration);
  }
}
