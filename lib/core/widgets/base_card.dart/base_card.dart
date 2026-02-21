import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(
          color: Colors.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
