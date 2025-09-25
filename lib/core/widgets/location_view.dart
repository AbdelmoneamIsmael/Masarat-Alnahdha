import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                // color: LightColors.greyColor,
                // shape: BoxShape.circle,
              ),
              child: Image.asset(AppImage.logo),
            ),
            8.horizontalSpace,
            Text(
              "•",
              style: AppTextStyle.bold14h24(context).copyWith(fontSize: 28.sp),
            ),
            8.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'توصيل إلى',
                  style: AppTextStyle.regular12(context).copyWith(height: 1.5),
                ),
                3.verticalSpace,
                Text(
                  'بغداد – المنصور، شارع 14 رمضان',
                  style: AppTextStyle.bold14h24(
                    context,
                  ).copyWith(height: 1.5, color: LightColors.orangeColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
