import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.body,
    this.leading,
  });

  final Widget? leading;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.md.all,
      child: SafeArea(
        child: Scaffold(
          body: body,
        ),
      ),
    );
  }
}
