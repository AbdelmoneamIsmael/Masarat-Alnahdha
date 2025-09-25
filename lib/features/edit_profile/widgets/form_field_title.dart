import 'package:flutter/material.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';

class FormFieldTitle extends StatelessWidget {
  const FormFieldTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyle.bold14h24(context));
  }
}
