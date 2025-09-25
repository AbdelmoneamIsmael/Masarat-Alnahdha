import 'dart:developer';
import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masarat_alnahdha/masarat_elnahda.dart';
import 'package:masarat_alnahdha/core/helpers/app_constants.dart';
import 'package:masarat_alnahdha/core/helpers/bloc_observer.dart';
import 'package:masarat_alnahdha/core/helpers/local_storage.dart';
import 'package:masarat_alnahdha/main.dart';

LocalStorage storage = LocalStorage();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Future<void> appInitialization() async {
  //  WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  var deviceLocale = Platform.localeName;
  log('deviceLocale$deviceLocale');
  Locale startLocal = const Locale('ar', 'EG');
  // await checkFirstLaunch();
  bool containLang = await storage.containKey(AppConstants.langCode);

  if (containLang) {
    String lang = await storage.readSecureData(AppConstants.langCode);
    debugPrint('App language =======> $lang');
    if (lang == 'ar') {
      startLocal = const Locale('ar', 'EG');
    } else {
      startLocal = const Locale('en', 'US');
    }
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      path: 'assets/lang',
      startLocale: startLocal,
      useOnlyLangCode: true,
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MassaratAlnahda(),
      ),
      // child: BlocProvider(
      //   create: (context) => getIt<ThemeCubit>(),
      //   child: MyApp(
      //     token: token,
      //     gradeId: gradeId,
      //   ),
      // ),
    ),
  );
}
