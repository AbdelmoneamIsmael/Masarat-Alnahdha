import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    this.onEditTap,
    // required this.userInfoModel,
  });
  final void Function()? onEditTap;
  // final UserInfoModel? userInfoModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEditTap,
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedImage(
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                url:
                    'https://i.pinimg.com/736x/77/8d/ed/778deda5d3d1e9a842d7f7ca6106be8d.jpg',
              ),
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ياسر محمد ", style: AppTextStyle.bold14h24(context)),
                5.verticalSpace,
                Text(
                  "almahd@gmail.com",
                  textDirection: TextDirection.ltr,
                  style: AppTextStyle.medium14(context),
                ),
                // 5.verticalSpace,
                // Text(
                //   "0123456789",
                //   textDirection: TextDirection.ltr,
                //   style: Theme.of(context).textTheme.labelMedium,
                // ),
              ],
            ),
            // const Spacer(),
            // Text(
            //   "تعديل",
            //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //         color: LightColors.redColor,
            //       ),
            // ),
          ],
        ),
      ),
    );
  }
}
