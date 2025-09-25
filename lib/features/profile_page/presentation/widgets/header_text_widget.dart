import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.regular12(context).copyWith(color: Color(0xffE25205)),
    );
  }
}
