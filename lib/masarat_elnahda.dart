// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/core/themes/theme/custom_theme.dart'
    as CustomTheme;
import '../../core/l10n/app_localizations.dart';
import '../../core/routes/page_routes.dart';

class MassaratAlnahda extends StatelessWidget {
  const MassaratAlnahda({super.key});
  // add git hub repo
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => AppCubit(),
    //   child: BlocBuilder<AppCubit, AppState>(
    //     builder: (context, state) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Masarat Alnahda',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('ar'),
          theme: CustomTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: PageRoutes.router,
          builder: (context, child) => child!,
        );
      },
    );
  }

  //     },
  //   ),
  // );
}
