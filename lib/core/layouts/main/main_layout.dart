import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/divider/app_divider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.header,
    required this.body,
    this.leading,
  });

  final Widget? leading;
  final Widget header;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(251, 250, 249, 1),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header,
                  ],
                ),
              ),
            ),
            AppDivider(),
            body,
          ],
        ),
      ),
    );
  }
}
