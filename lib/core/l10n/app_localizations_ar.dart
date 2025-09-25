// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get viewCategory => 'عرض الكل';

  @override
  String get news => 'الأخبار';

  @override
  String get magazine => 'تصفح الدليل';

  @override
  String get description => 'الوصف';

  @override
  String get aboutUs => 'من نحن';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get shareSuccess => 'تم مشاركة التطبيق بنجاح';

  @override
  String get shareAppMessage =>
      'مشاركه التطبيق  \n Google Play Store: https://play.google.com/store/apps/details \n Apple AppStore: https://apps.apple.com/us/app ';
}
