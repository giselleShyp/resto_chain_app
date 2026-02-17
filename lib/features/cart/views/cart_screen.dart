import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppText(
            'Cart Screen',
          )
        ],
      ),
    );
  }
}
