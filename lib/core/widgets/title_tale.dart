import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleTale extends StatelessWidget {
  const TitleTale({
    super.key,
    required this.title,
    this.option,
    this.onPressed,
  });
  final String title;
  final String? option;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
      child: Row(
        children: [
          Text(title, style: AppTextStyle.bold16(context)),
          const Spacer(),
          GestureDetector(
            onTap: option == null ? null : onPressed,
            child: Text(
              option ?? '',
              style: AppTextStyle.medium14(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.surface),
            ),
          ),
        ],
      ),
    );
  }
}
