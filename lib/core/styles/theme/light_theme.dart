import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';

ThemeData englishLightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'poppins',
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondary,
    onSecondary: Colors.black,
    error: AppColors.error,
    onError: Colors.white,
    background: AppColors.background,
    onBackground: AppColors.textPrimary,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
  ),
);

ThemeData arabicLightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'cairo',
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondary,
    onSecondary: Colors.black,
    error: AppColors.error,
    onError: Colors.white,
    background: AppColors.background,
    onBackground: AppColors.textPrimary,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
  ),
);
