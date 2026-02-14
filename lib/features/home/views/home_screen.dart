import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppText(
            'Home Screen',
          )
        ],
      ),
    );
  }
}
