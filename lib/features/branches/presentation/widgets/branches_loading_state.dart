import 'package:flutter/cupertino.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/shimmer/container_shimmer_loader.dart';

class BranchesLoadingState extends StatelessWidget {
  const BranchesLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      itemCount: 3,
      separatorBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ));
      },
      itemBuilder: (context, index) {
        return ContainerShimmerLoader(
          height: 150,
        );
      },
    );
  }
}
