import 'package:masarat_alnahdha/core/models/categories/categorie_model.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/core/widgets/ui_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    super.key,
    required this.categoryModel,
    this.onPressed,
  });
  final CategorieModel categoryModel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      minimumSize: Size(0, 0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(3),
            width: 60.w,
            height: 60.h,
            decoration: ShapeDecoration(
              shadows: [UiHelper.shadow(context)],
              color: Theme.of(context).primaryColor,
              shape: OvalBorder(),
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(135.h),
              child: CachedImage(
                width: 60.w,
                height: 60.h,
                url: categoryModel.imagefrontsmallurl ?? '',
              ),
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            child: Text(
              categoryModel.name!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
