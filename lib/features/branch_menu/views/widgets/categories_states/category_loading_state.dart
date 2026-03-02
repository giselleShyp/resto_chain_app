import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/shimmer/container_shimmer_loader.dart';

class CategoryLoadingState extends StatelessWidget {
  const CategoryLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => Gaps.w8,
        itemBuilder: (context, index) {
          return ContainerShimmerLoader(
            height: 40,
          );
        },
      ),
    );
  }
}
