import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedGridView extends StatelessWidget {
  const AnimatedGridView({
    super.key,
    this.columnCount = 1,
    required this.position,
    required this.child,
    this.verticalOffset,
    this.horizontalOffset,
    this.duration = const Duration(milliseconds: 250),
    this.delay = const Duration(milliseconds: 100),
  });

  final Widget child;
  final int columnCount;
  final int position;
  final Duration duration;
  final Duration? delay;
  final double? horizontalOffset;
  final double? verticalOffset;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: position,
      columnCount: columnCount,
      duration: duration,
      child: SlideAnimation(
        horizontalOffset: horizontalOffset,
        verticalOffset: verticalOffset,
        child: FadeInAnimation(
          delay: delay,
          curve: Curves.easeInOut,
          child: child,
        ),
      ),
    );
  }
}
