import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedGridView extends StatelessWidget {
  const AnimatedGridView({
    super.key,
    this.duration,
    required this.itemCount,
    required this.itemBuilder,
    this.gridDelegate,
  });
  final Duration? duration;
  final Widget? Function(BuildContext, int) itemBuilder;
  final SliverGridDelegate? gridDelegate;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate:
            gridDelegate ??
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // mainAxisExtent: 0,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 167 / 211,
            ),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}

class CustomAnimationConfiguration extends StatelessWidget {
  const CustomAnimationConfiguration({
    super.key,
    required this.index,
    required this.widget,
  });
  final int index;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 400),
      columnCount: 2,
      child: ScaleAnimation(child: FadeInAnimation(child: widget)),
    );
  }
}
