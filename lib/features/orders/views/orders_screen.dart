import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/layouts/main/main_layout.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/orders/views/widgets/order_card.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Column(
          children: [
            OrderCard(
              branchName: "Burger",
              orderDate: DateTime.now(),
              orderStatus: OrderStatus.delivered,
              orderPrice: 13.0,
            ),
          ],
        ),
      ),
    );
  }
}
