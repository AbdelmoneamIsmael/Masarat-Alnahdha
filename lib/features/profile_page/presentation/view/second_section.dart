import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/core/const/app_const.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/themes/theme/custom_theme.dart';
import 'package:masarat_alnahdha/core/utills/cache_helper.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/view/change_lang_bottom_sheet.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/widgets/profile_widget.dart';
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ProfileOptionWidget(
          title: "إعدادات اللغة",
          leadingAssset: AppImage.languageIcon,
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.3,
                  minChildSize: 0.1,
                  maxChildSize: 0.9,
                  expand: false,
                  builder: (context, scrollController) {
                    return ChangeLangBottomSheet(
                      scrollController: scrollController,
                    );
                  },
                );
              },
            );
          },
        ),
        ProfileOptionWidget(
          title: 'تواصل معنا',
          leadingAssset: AppImage.contactUsIcon,
          onTap: () {
            GoRouter.of(context).push(PagesKeys.contactUs);
          },
        ),
      //   ThemeSwitcher(
      //     builder: (context) {
      //       return ProfileOptionWidget(
      //         title: "الوضع الليلي",
      //         leadingAssset: AppImage.themeIcon,
      //         onTap: () {
      //           var brightness = ThemeModelInheritedNotifier.of(
      //             context,
      //           ).theme.brightness;
      //           ThemeSwitcher.of(context).changeTheme(
      //             theme: brightness == Brightness.light
      //                 ? darkTheme
      //                 : lightTheme,
      //             isReversed: brightness == Brightness.light ? true : false,
      //           );
      //           CacheHelper.saveData(
      //             key: kTheme,
      //             value: brightness == Brightness.light,
      //           );
      //         },
      //         trailing: SizedBox(
      //           width: 26,
      //           height: 16,
      //           child: Transform.scale(
      //             scale: 0.7,
      //             child: Switch(
      //               value:
      //                   ThemeModelInheritedNotifier.of(
      //                     context,
      //                   ).theme.brightness ==
      //                   Brightness.dark,
      //               onChanged: (val) {
      //                 var brightness = ThemeModelInheritedNotifier.of(
      //                   context,
      //                 ).theme.brightness;

      //                 ThemeSwitcher.of(context).changeTheme(
      //                   theme: brightness == Brightness.light
      //                       ? darkTheme
      //                       : lightTheme,
      //                   isReversed: brightness == Brightness.light,
      //                 );

      //                 CacheHelper.saveData(
      //                   key: kTheme,
      //                   value: brightness == Brightness.light,
      //                 );
      //               },
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      ],
    );
  }
}
