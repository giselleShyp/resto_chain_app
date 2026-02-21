import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height = 0.0,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: Colors.grey.withValues(alpha: 0.2),
    );
  }
}
