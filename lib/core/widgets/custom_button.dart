import 'package:flutter/material.dart';
import '../../core/themes/styles/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.fontSize,
    required this.foregroundColor,
    required this.backgroundColor,
    this.verticalPadding,
    this.horizontalPadding,
    required this.borderRadius,
    required this.title,
  });
  final Color foregroundColor, backgroundColor;
  final double? verticalPadding, horizontalPadding, fontSize;
  final BorderRadius? borderRadius;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0,
          horizontal: horizontalPadding ?? 0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyle.medium18(
          context,
        ).copyWith(fontWeight: FontWeight.w900, fontSize: fontSize),
      ),
    );
  }
}
