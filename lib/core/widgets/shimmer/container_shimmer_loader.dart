import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:shimmer/shimmer.dart';

class ContainerShimmerLoader extends StatelessWidget {
  const ContainerShimmerLoader({
    super.key,
    this.height = 0.1,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withValues(alpha: 0.5),
      highlightColor: Colors.grey.withValues(alpha: 0.3),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }
}
