// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get viewCategory => 'view All';

  @override
  String get news => 'News';

  @override
  String get magazine => 'magazine';

  @override
  String get description => 'description';

  @override
  String get aboutUs => 'About Us';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get shareSuccess => 'App Shared Successfully Thanks For Your Feedback';

  @override
  String get shareAppMessage =>
      'Share App \nGoogle Play Store: https://play.google.com/store/apps/details \n Apple AppStore: https://apps.apple.com/us/app ';
}
