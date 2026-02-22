import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/branches/views/widgets/branch_card.dart';

class BranchesScreen extends StatelessWidget {
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
          "Restaurant Name",
          contentStyle: ContentStyle.titleLarge,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            BranchCard(
              name: "Burger Joint - Downtown",
              address: "123 main st,Downtown",
              distance: "0.6km",
              workingHours: "10 Am - 10 PM",
              status: BranchStatus.open,
            ),
          ],
        ),
      ),
    );
  }
}
