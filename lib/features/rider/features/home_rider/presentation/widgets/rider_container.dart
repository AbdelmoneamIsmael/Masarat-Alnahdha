import 'package:flutter/material.dart';

class RiderContainer extends StatelessWidget {
  const RiderContainer({
    super.key,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.borderRadius,
    this.child,
  });
  final EdgeInsetsGeometry? padding, margin;
  final double? height, width;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding,
      margin: margin,

      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black87
            : Colors.white.withValues(alpha: .9),
      ),
      child: child,
    );
  }
}
