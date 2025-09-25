import 'package:masarat_alnahdha/core/models/product/product_model.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersPageItem extends StatelessWidget {
  const OrdersPageItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 16),
      decoration: BoxDecoration(
        color: LightColors.greyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.r),
          topRight: Radius.circular(4.r),
        ),
        // border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 8.0,
                          end: 4,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            8.verticalSpace,
                            Text(
                              productModel.name,
                              style: AppTextStyle.bold14h24(context).copyWith(
                                color: LightColors.primaryColor,
                                height: 1.5,
                              ),
                            ),
                            6.verticalSpace,
                            Text(
                              '3 قطع دجاج + 3 قطع شاورما + بطاطس + كول سلو + مشروب',
                              style: AppTextStyle.regular12(context).copyWith(
                                color: Color(0xff8C8C8C),
                                height: 1.5,
                                fontSize: 10.sp,
                              ),
                            ),
                            12.verticalSpace,
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/location.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                                6.horizontalSpace,
                                Expanded(
                                  child: Text(
                                    'بغداد – المنصور، شارع 14 رمضان، مجاور مطعم....',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.regular12(context)
                                        .copyWith(
                                          color:
                                              LightColors.lightBlackBackground,
                                          height: 1.5,
                                          fontSize: 12.sp,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            12.horizontalSpace,
                            Center(
                              child: Text(
                                '5,000 د.ع',
                                style: AppTextStyle.bold16(context).copyWith(
                                  color: LightColors.primaryColor,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(color: LightColors.redColor),
                  child: Center(
                    child: Text(
                      'إلغاء الطلب',
                      style: AppTextStyle.bold14h24(
                        context,
                      ).copyWith(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 130.w,
            child: AspectRatio(
              aspectRatio: 130 / 150,

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
          ),
        ],
      ),
    );
  }
}
