import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/layouts/main/main_layout.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      header: AppText(
        'My Orders',
        contentStyle: ContentStyle.titleLarge,
        fontWeight: FontWeight.w500,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
