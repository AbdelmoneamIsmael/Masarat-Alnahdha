import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, this.loadingColor, this.size = 70});

  final Color? loadingColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        color: loadingColor ?? Theme.of(context).colorScheme.shadow,
        size: size,
      ),
    );
  }
}
