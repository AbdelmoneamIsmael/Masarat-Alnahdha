import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ProfileOptionWidget(
          title: "تعديل البروفايل",
          leadingAssset: AppImage.profileIcon,
          onTap: () {
            GoRouter.of(context).push(PagesKeys.editProfilePage);
          },
        ),
        ProfileOptionWidget(
          title: "العنوان",
          leadingAssset: AppImage.locationProfileIcon,
          onTap: () {
            GoRouter.of(context).push(PagesKeys.profileAddressPage);
          },
        ),
        ProfileOptionWidget(
          title: "الاشعارات",
          leadingAssset: AppImage.notificationIcon,
          onTap: () {
            GoRouter.of(context).push(PagesKeys.notificationPage);
          },
        ),
      ],
    );
  }
}
