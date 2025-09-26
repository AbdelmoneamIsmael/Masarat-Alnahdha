import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masarat_alnahdha/core/theming/styles.dart';

class CustomTitledLogo extends StatelessWidget {
  const CustomTitledLogo({
    super.key,
    required this.title,
    required this.logoImage,
    required this.subtitle,
  });
  final String title, logoImage, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(10.r),

                // decoration: BoxDecoration(
                //   color: Theme.of(context).scaffoldBackgroundColor,
                //   shape: BoxShape.rectangle,
                //   borderRadius: BorderRadius.circular(10.r),
                //   border: Border.all(
                //     color: LightColors.secondBackgroundColor.withValues(
                //       alpha: 0.2,
                //     ),
                //     width: 7,
                //   ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Theme.of(context).colorScheme.shadow,
                //     blurRadius: 5,
                //     spreadRadius: -3,
                //     offset: Offset(0, 0),
                //   ),
                // ],
                child: logoImage.contains('.svg')
                    ? SvgPicture.asset(
                        logoImage,
                        width: 100,
                        height: 100,
                        fit: BoxFit.scaleDown,
                      )
                    : Image.asset(
                        logoImage,
                        width: 250.w,

                        fit: BoxFit.scaleDown,
                      ),
              ),
            ],
          ),
        ),

        Text(
          title,
          style: TextStyles.font18MintBold.copyWith(
            fontSize: 20.sp,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        8.verticalSpace,
        Text(
          subtitle,
          style: TextStyles.font15BlackRegular.copyWith(
            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
