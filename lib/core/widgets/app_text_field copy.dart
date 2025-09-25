import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/themes/styles/app_text_style.dart';

class AppTextFieldWithTitle extends StatelessWidget {
  const AppTextFieldWithTitle({
    super.key,
    required this.title,
    required this.hint,
    this.scure = false,
    this.enabeld = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.autofillHints,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.isRequired = false,
    this.verticalPadding,
    this.horizontalPadding,
  });
  final String title, hint;
  final bool scure, enabeld, readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? prefixIcon, suffixIcon;
  final bool isRequired;
  final double? verticalPadding, horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isRequired)
          Row(
            children: [
              Text(title, style: AppTextStyle.medium14h24(context)),

              Text(
                "*",
                style: AppTextStyle.medium14h24(
                  context,
                ).copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        if (isRequired) const SizedBox(height: 13),
        AppTextField(
          horizontalPadding: horizontalPadding,
          verticalPadding: verticalPadding,
          hint: hint,
          scure: scure,
          enabeld: enabeld,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLines: maxLines,
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.scure = false,
    this.enabeld = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.autofillHints,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.withBorder = false,
    this.borderRadius,
    this.focusedBorder,
    this.verticalPadding,
    this.horizontalPadding, this.onChanged,
  });
  final String hint;
  final bool scure, enabeld, readOnly, withBorder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final double? verticalPadding, horizontalPadding;
  final Color? fillColor;
  final Widget? prefixIcon, suffixIcon;
  final BorderRadius? borderRadius;
  final InputBorder? focusedBorder;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: scure,
      readOnly: readOnly,
      enabled: enabeld,
      validator: validator,
      autocorrect: true,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.center,
      style: AppTextStyle.medium16h24(context).copyWith(height: 1),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20.w,
          vertical: verticalPadding ?? 16.h,
        ),
        isDense: true,
        hintStyle: AppTextStyle.regular12(context).copyWith(
          color: Theme.of(context).colorScheme.shadow.withValues(alpha: .7),
        ),
        hintText: hint,
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(
                width: .8,
                color: withBorder
                    ? Theme.of(context).textTheme.bodyMedium!.color!
                    : Colors.transparent,
              ),
            ),
        filled: true,
        fillColor: fillColor ?? Color(0xffF5F5F5),
        enabledBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(
                width: .8,
                color: withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
              ),
            ),
        disabledBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(
                width: .8,
                color: withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
              ),
            ),
        border:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(
                width: .8,
                color: withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          borderSide: BorderSide(
            width: .8,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
