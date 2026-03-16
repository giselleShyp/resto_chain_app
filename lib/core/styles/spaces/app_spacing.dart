import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  static late double _scale;

  static void init(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    const referenceWidth = 375.0;

    _scale = width / referenceWidth;

    _scale = _scale.clamp(0.85, 1.25);
  }

  static double get xxs => 2 * _scale;
  static double get xs => 4 * _scale;
  static double get sm => 8 * _scale;
  static double get md => 16 * _scale;
  static double get lg => 24 * _scale;
  static double get xl => 32 * _scale;
  static double get xxl => 40 * _scale;
}

class Gaps {
  Gaps._();

// Vertical
  static const SizedBox h2 = SizedBox(height: 2);
  static const SizedBox h4 = SizedBox(height: 4);
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h12 = SizedBox(height: 12);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h20 = SizedBox(height: 20);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h32 = SizedBox(height: 32);
  static const SizedBox h40 = SizedBox(height: 40);
  static const SizedBox h48 = SizedBox(height: 48);
  static const SizedBox h64 = SizedBox(height: 64);

  // Horizontal
  static const SizedBox w2 = SizedBox(width: 2);
  static const SizedBox w4 = SizedBox(width: 4);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w12 = SizedBox(width: 12);
  static const SizedBox w16 = SizedBox(width: 16);
  static const SizedBox w24 = SizedBox(width: 24);
  static const SizedBox w32 = SizedBox(width: 32);
}

extension SpacingExtensions on double {
  EdgeInsets get all => EdgeInsets.all(this);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);

  EdgeInsets only({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) {
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  SizedBox get h => SizedBox(height: this);

  SizedBox get w => SizedBox(width: this);
}
