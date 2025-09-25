import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/core/helpers/spacing.dart';
import 'package:masarat_alnahdha/core/helpers/widget_extensions.dart';
import 'package:masarat_alnahdha/core/theming/colors.dart';
import 'package:masarat_alnahdha/core/theming/styles.dart';

class ScaffoldTransAppBar extends StatelessWidget {
  final Widget? leading, actions, body;
  final String title;
  final Color? backgroundColor, iconColor;
  final TextStyle? titleStyle;
  final VoidCallback? onBackPressed;
  const ScaffoldTransAppBar({
    super.key,
    this.onBackPressed,
    this.leading,
    this.actions,
    this.body,
    required this.title,
    this.backgroundColor,
    this.iconColor,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? ColorsManager.bgColor,

      body: Column(
        spacing: 1.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(1),
          Row(
            children: [
              leading ??
                  IconButton(
                    onPressed: () {
                      if (onBackPressed != null) onBackPressed!();
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: iconColor ?? ColorsManager.mainHomeColor,
                  ),
              Text(
                title,
                style:
                    titleStyle ??
                    TextStyles.font17BlackExtraBold.copyWith(
                      color: ColorsManager.mainHomeColor,
                    ),
              ),
              Spacer(),
              actions ??
                  IconButton(
                    onPressed: () {
                      // Implement search functionality here
                    },
                    icon: Icon(Icons.search),
                    color: iconColor ?? ColorsManager.mainHomeColor,
                  ),
            ],
          ).paddingDirOnly(start: 5.w, end: 7.w),
          verticalSpace(2),
          ?body,
        ],
      ),
    );
  }
}
