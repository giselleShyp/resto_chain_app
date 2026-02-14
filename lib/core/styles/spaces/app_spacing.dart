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

  static double get xs => 4 * _scale;
  static double get sm => 8 * _scale;
  static double get md => 16 * _scale;
  static double get lg => 24 * _scale;
  static double get xl => 32 * _scale;
  static double get xxl => 40 * _scale;
}

class Gaps {
  Gaps._();

  static const SizedBox h4 = SizedBox(height: 4);
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h16 = SizedBox(height: 16);

  static const SizedBox w4 = SizedBox(width: 4);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w16 = SizedBox(width: 16);
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
