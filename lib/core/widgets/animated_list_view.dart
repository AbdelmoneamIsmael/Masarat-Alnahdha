import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListView extends StatelessWidget {
  const AnimatedListView({
    super.key,
    this.duration,
    this.animationType,
    required this.child,
    required this.itemCount,
  });
  final Duration? duration;
  final Widget? animationType, child;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: duration ?? const Duration(milliseconds: 400),
            child:
                animationType ??
                SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: child!),
                ),
          );
        },
      ),
    );
  }
}
