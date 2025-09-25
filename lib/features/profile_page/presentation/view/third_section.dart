import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/page_routes.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ProfileOptionWidget(
          title: "نبذة عن التطبيق",
          leadingAssset: AppImage.aboutAppIcon,
          onTap: () {
            GoRouter.of(context).push(PagesKeys.aboutAppPage);
          },
        ),
        ProfileOptionWidget(
          title: "شروط الاستخدام",
          leadingAssset: AppImage.termisAndConditionIcon,
          onTap: () {
            GoRouter.of(context).push(PagesKeys.termisAndConditions);
          },
        ),
        ProfileOptionWidget(
          title: "الأسئلة الشائعة",
          leadingAssset: AppImage.helpIcon,
          onTap: () {
            GoRouter.of(context).push(PagesKeys.helpPage);
          },
        ),
        ProfileOptionWidget(
          title: "تسجيل الخروج",
          trailing: SizedBox(),
          leadingAssset: AppImage.logOutIcon,
          withBorder: false,
          onTap: () {
            PageRoutes.router.pushReplacement(PagesKeys.loginPage);
          },
        ),
      ],
    );
  }
}
