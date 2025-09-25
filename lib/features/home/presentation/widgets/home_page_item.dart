import 'package:masarat_alnahdha/core/models/product/product_model.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).w,
      decoration: BoxDecoration(
        color: LightColors.greyColor,
        borderRadius: BorderRadius.circular(4.r),
        // border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    productModel.name,
                    style: AppTextStyle.bold14h24(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.surface),
                  ),
                  6.verticalSpace,
                  Text(
                    '3 قطع دجاج + 3 قطع شاورما + بطاطس + كول سلو + مشروب',
                    style: AppTextStyle.regular12(
                      context,
                    ).copyWith(height: 1.5, color: Colors.black),
                  ),
                  8.verticalSpace,
                  Center(
                    child: Text(
                      '${productModel.price} د.ع',
                      style: AppTextStyle.bold16(
                        context,
                      ).copyWith(color: LightColors.orangeColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: 150.w,
                child: AspectRatio(
                  aspectRatio: 150 / 130,
                  child: Opacity(
                    opacity: 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      child: CachedImage(url: productModel.imageUrl),
                    ),
                  ),
                ),
              ),
              if (productModel.productId == 99 || productModel.productId == 97)
                Positioned(
                  left: 0,
                  child: SvgPicture.asset("assets/svgs/most_view.svg"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
