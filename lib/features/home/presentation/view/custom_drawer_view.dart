import 'package:masarat_alnahdha/core/const/app_const.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/themes/theme/custom_theme.dart';
import 'package:masarat_alnahdha/core/utills/cache_helper.dart';
import 'package:masarat_alnahdha/features/home/presentation/widgets/custom_drawer_item.dart';
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  children: [
                    30.verticalSpace,
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(AppImage.removeIcon),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text("Amr Mohamed", style: AppTextStyle.bold16(context)),
                    Text(
                      "amr@gmial.com",
                      style: AppTextStyle.regular14(context),
                    ),
                    40.verticalSpace,
                    CustomDrawerItem(
                      icon: Icons.person,
                      title: 'الملف الشخصى',
                      onTap: () {},
                    ),
                    CustomDrawerItem(
                      icon: Icons.question_mark,
                      title: 'من نحن',
                      onTap: () {
                        GoRouter.of(context).push(PagesKeys.favoritesPage);
                      },
                    ),
                    CustomDrawerItem(
                      icon: Icons.phone_in_talk_rounded,
                      title: 'اتصل بنا',
                      onTap: () {
                        GoRouter.of(context).push(PagesKeys.favoritesPage);
                      },
                    ),
                    CustomDrawerItem(
                      icon: Icons.heart_broken_sharp,
                      title: 'المفضلة',
                      onTap: () {
                        GoRouter.of(context).push(PagesKeys.favoritesPage);
                      },
                    ),
                    // ThemeSwitcher(
                    //   clipper: const ThemeSwitcherCircleClipper(),
                    //   builder: (context) {
                    //     return CustomDrawerItem(
                    //       icon: Icons.dark_mode,
                    //       title: 'الوضع الليلى',
                    //       trailing: Transform.scale(
                    //         scale:
                    //             0.7, // Adjust this value between 0.0 and 1.0 to make it smaller or larger
                    //         child: Switch(
                    //           padding: EdgeInsets.zero,
                    //           value:
                    //               ThemeModelInheritedNotifier.of(
                    //                 context,
                    //               ).theme.brightness ==
                    //               Brightness.dark,
                    //           onChanged: (value) {
                    //             var brightness = ThemeModelInheritedNotifier.of(
                    //               context,
                    //             ).theme.brightness;
                    //             ThemeSwitcher.of(context).changeTheme(
                    //               theme: brightness == Brightness.light
                    //                   ? darkTheme
                    //                   : lightTheme,
                    //               isReversed: brightness == Brightness.light
                    //                   ? true
                    //                   : false,
                    //             );
                    //             CacheHelper.saveData(
                    //               key: kTheme,
                    //               value: brightness == Brightness.light,
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //       onTap: () {
                    //         var brightness = ThemeModelInheritedNotifier.of(
                    //           context,
                    //         ).theme.brightness;
                    //         ThemeSwitcher.of(context).changeTheme(
                    //           theme: brightness == Brightness.light
                    //               ? darkTheme
                    //               : lightTheme,
                    //           isReversed: brightness == Brightness.light
                    //               ? true
                    //               : false,
                    //         );
                    //         CacheHelper.saveData(
                    //           key: kTheme,
                    //           value: brightness == Brightness.light,
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    CustomDrawerItem(
                      icon: Icons.logout,
                      title: 'تسجيل الخروج',
                      isLogout: true,
                      trailing: SizedBox(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
