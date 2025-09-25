import 'package:masarat_alnahdha/core/generated/app_icons.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: isSelected ? 2 : 1,
          color: isSelected
              ? Theme.of(context).colorScheme.surface
              : LightColors.greyColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/location_widget.png"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12).w,
            decoration: BoxDecoration(
              color: LightColors.greyColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.locationIcon),
                8.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'العنوان',
                        style: AppTextStyle.bold16(context).copyWith(
                          fontSize: 12.sp,
                          height: 1.5,
                          color: LightColors.lightBlackBackground,
                        ),
                      ),
                      Text(
                        'بغداد – المنصور، شارع 14 رمضان، مجاور مطعم',
                        style: AppTextStyle.regular14h21(context).copyWith(
                          fontSize: 12.sp,
                          height: 1.5,

                          color: LightColors.lightBlackBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                8.horizontalSpace,
                Text(
                  "تغيير",
                  style: AppTextStyle.bold16(context).copyWith(
                    fontSize: 12.sp,
                    height: 1.5,
                    color: LightColors.redColor,
                  ),
                ),
              ],
            ),
          ),
          // CircleAvatar(
          //   radius: 35,
          //   backgroundColor: LightColors.blueColor.withValues(alpha: .1),
          //   //  Theme.of(
          //   //   context,
          //   // ).colorScheme.inversePrimary.withValues(alpha: .8),
          //   child: Image.asset(
          //     AppImage.locationIcon,
          //     fit: BoxFit.scaleDown,
          //     width: 50,
          //     height: 50,
          //   ),
          // ),
          // 20.horizontalSpace,
          // Column(
          //   spacing: 2,
          //   children: [
          //     Text('Assign Address', style: AppTextStyle.bold16(context)),
          //     Text(
          //       'Assign Address',
          //       style: AppTextStyle.regular14h21(
          //         context,
          //       ).copyWith(color: LightColors.greyColor),
          //     ),
          //     Text(
          //       'Assign Address',
          //       style: AppTextStyle.regular14h21(
          //         context,
          //       ).copyWith(color: LightColors.greyColor),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
