import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppScrollableState extends StatelessWidget {
  const AppScrollableState({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        // Take up full height of the screen to ensure the drag area is large
        height: Get.height * 0.7,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
