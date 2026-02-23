import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/branch_menu/views/widgets/menu_item_card.dart';

class BranchMenuScreen extends StatelessWidget {
  const BranchMenuScreen({super.key});

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
            MenuItemCard(
              name: "name name ",
              description: "description ",
              imageUrl:
                  "https://stories.freepiklabs.com/storage/52060/hamburger-amico-4792.png",
              price: 13.0,
              onAdd: () {},
            ),
          ],
        ),
      ),
    );
  }
}
