import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/models/product/product_model.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishedOrderItem extends StatelessWidget {
  const FinishedOrderItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 16),
      decoration: BoxDecoration(
        color: LightColors.greyColor,
        borderRadius: BorderRadius.circular(4.r),
        // border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0, end: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      8.verticalSpace,
                      Text(
                        productModel.name,
                        style: AppTextStyle.bold14h24(context).copyWith(
                          color: Theme.of(context).colorScheme.surface,
                          height: 1.5,
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        '3 قطع دجاج + 3 قطع شاورما + بطاطس + كول سلو + مشروب',

                        style: AppTextStyle.regular12(
                          context,
                        ).copyWith(height: 1.5, color: Color(0xff8C8C8C)),
                      ),
                      16.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImage.locationProfileIcon,
                            width: 12.w,
                            height: 12.h,
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              'بغداد – المنصور، شارع 14 رمضان، مجاور مطعم....',
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.regular12(
                                context,
                              ).copyWith(height: 1.5, color: Color(0xff191B1C)),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                    ],
                  ),
                ),
                // 8.verticalSpace,
                // PrimaryButton(
                //   radius: 0,
                //   isMax: true,
                //   height: 25.h,
                //   backgroundColor: Colors.red,
                //   text: 'إلغاء الطلب',
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          SizedBox(
            width: 130.w,
            height: 110.h,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(50.r),
                ),
                child: productModel.imageUrl.contains("assets")
                    ? Image.asset(productModel.imageUrl)
                    : CachedImage(url: productModel.imageUrl),
              ),
            ),
            // Stack(
            //   children: [
            //     SizedBox(width: 120.w, height: 110.h),
            //     Positioned(
            //       top: 20,
            //       child: ClipRRect(
            //         borderRadius: BorderRadiusDirectional.only(
            //           topStart: Radius.circular(50.r),
            //         ),
            //         child: CachedImage(
            //           url: newProductsList[index].imageUrl,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
