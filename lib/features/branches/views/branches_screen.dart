import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/branches/controllers/branches_controller.dart';
import 'package:resto_chain_app/features/branches/views/state_views/branches_empty_screen.dart';
import 'package:resto_chain_app/features/branches/views/state_views/branches_error_screen.dart';
import 'package:resto_chain_app/features/branches/views/state_views/branches_loading_screen.dart';
import 'package:resto_chain_app/features/branches/views/widgets/branch_card.dart';

class BranchesScreen extends GetView<BranchesController> {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Container(
            color: Colors.grey.withValues(alpha: 0.2),
            height: 1.0,
          ),
        ),
        title: AppText(
          controller.restaurant.name,
          contentStyle: ContentStyle.titleLarge,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () {
          switch (controller.state.value) {
            case ViewState.loading:
              return BranchesLoadingScreen();

            case ViewState.error:
              return BranchesErrorScreen(
                message: "Somethings wrong happen",
                onTap: () => controller.refresh(),
              );

            case ViewState.empty:
              return BranchesEmptyScreen(message: "No branches found");

            case ViewState.success:
              return Padding(
                padding: EdgeInsets.all(AppSpacing.md),
                child: RefreshIndicator(
                  onRefresh: () => controller.refresh(),
                  child: ListView.builder(
                    itemCount: controller.branches.length,
                    itemBuilder: (context, index) {
                      final branch = controller.branches[index];
                      return BranchCard(
                        name: branch.branchName,
                        address: branch.location,
                        distance: "0.6km", //Not used now
                        workingHours: branch.workingHours.formattedRange(),
                        isOpen: branch.isOpen,
                        onTap: () {
                          Get.toNamed(AppRoutes.branchMenu, arguments: branch);
                        },
                      );
                    },
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
