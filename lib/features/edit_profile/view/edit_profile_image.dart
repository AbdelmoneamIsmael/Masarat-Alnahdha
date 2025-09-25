import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedImage(
                height: 150.h,
                width: 150.w,
                url:
                    "https://www.infoescola.com/wp-content/uploads/2011/02/chef.jpg",
              ),
            ),
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.edit, color: Colors.green),
            ),
          ],
        ),
        16.verticalSpace,
        Text('محمد أحمد علي', style: AppTextStyle.bold18(context)),
        4.verticalSpace,
        Text('محمد أحمد علي', style: AppTextStyle.regular14(context)),
        16.verticalSpace,
      ],
    );
  }
}
