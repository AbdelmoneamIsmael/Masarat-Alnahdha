import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/page_routes.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/core/widgets/ui_function.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RiderAccountPage extends StatelessWidget {
  const RiderAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: AppBar(),
      body: Column(
        children: [
          // ResturantProfileAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: 18,
              children: [
                ProfileOptionWidget(
                  title: "تعديل البروفايل",
                  leadingAssset: AppImage.profileIcon,
                  onTap: () {
                    GoRouter.of(context).push(PagesKeys.editProfilePage);
                  },
                ),
                ProfileOptionWidget(
                  title: "الطلبات والمدفوعات",
                  leadingAssset: AppImage.printerIcon,
                  onTap: () {},
                ),
                // ProfileOptionWidget(
                //   title: "إعدادات اللغة",
                //   leadingAssset: AppImage.languageIcon,
                //   onTap: () {},
                // ),
                // ProfileOptionWidget(
                //   title: "عناوين الفروع",
                //   leadingAssset: AppImage.locationProfileIcon,
                //   onTap: () {},
                // ),
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
            ),
          ),
        ],
      ),
    );
  }
}

class ResturantProfileAppBar extends StatelessWidget {
  const ResturantProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: CachedImage(
            url: 'https://images.unsplash.com/photo-1524351199678-941a58a3df50',
            height: 185.h,
            width: double.infinity,
          ),
        ),
        Positioned(
          right: 40,
          left: 40,
          top: 107.h,
          // bottom: -50,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).primaryColor,
              boxShadow: [UiHelper.shadow(context)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppImage.bastaImage),
                        Column(
                          children: [
                            Text('بسطة', style: AppTextStyle.bold18(context)),
                            Text(
                              'مطعم مشويات',
                              style: AppTextStyle.regular12(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImage.star),
                            Text('4.5', style: AppTextStyle.regular16(context)),
                          ],
                        ),
                        Text(
                          '+1500 طلب',
                          style: AppTextStyle.regular16(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Theme.of(context).colorScheme.onPrimary),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResturantProfileCardItem(
                      image: AppImage.bataImage,
                      subtitle: 'مجاني',
                      title: 'التوصيل',
                    ),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    ResturantProfileCardItem(
                      image: AppImage.clock,
                      subtitle: 'مواعيد العمل',
                      title: '24 ساعة',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ResturantProfileCardItem extends StatelessWidget {
  const ResturantProfileCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title, subtitle, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(image),
            Text(
              title,
              style: AppTextStyle.bold14h24(context).copyWith(fontSize: 12),
            ),
          ],
        ),
        Text(
          subtitle,
          style: AppTextStyle.regular12(
            context,
          ).copyWith(color: Color(0xffE25205)),
        ),
      ],
    );
  }
}
