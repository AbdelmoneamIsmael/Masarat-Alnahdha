import 'package:masarat_alnahdha/core/models/categories/categorie_model.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.categoryModel,
    required this.viewRight,
    this.onPressed,
  });

  final CategorieModel categoryModel;
  final bool viewRight;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xFF1B5970),
      onTap: onPressed,
      child: Container(
        height: 200.h,
        // margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 12,
              offset: Offset(-7, 7),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedImage(url: categoryModel.imagefrontsmallurl!),
            ),
            Align(
              alignment: viewRight
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                child: Text(
                  categoryModel.name!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
