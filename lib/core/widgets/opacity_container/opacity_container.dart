import 'package:flutter/cupertino.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';

class OpacityContainer extends StatelessWidget {
  const OpacityContainer({
    super.key,
    required this.color,
    this.padding,
    required this.child,
  });

  final Color color;
  final double? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? AppSpacing.sm,
        vertical: padding ?? AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: child,
    );
  }
}
