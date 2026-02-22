import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/layouts/main/main_layout.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/cart/views/state_view/cart_screen_empty.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      header: AppText(
        'Cart',
        contentStyle: ContentStyle.titleLarge,
        fontWeight: FontWeight.w500,
      ),
      body: Expanded(
        child: CartScreenEmpty(),
      ),
    );
  }
}
