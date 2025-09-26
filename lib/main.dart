// import 'package:firebase_core/firebase_core.dart';
import 'masarat_elnahda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/const/app_const.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helper/bloc_observer.dart';
import '../../../core/models/user_model/user_model.dart';
import '../../../core/utills/cache_helper.dart';
// import '../../../firebase_options.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //main
  // await initializeOneSignal();
  await CacheHelper.init();

  await setupGetIt();
  // await Hive.initFlutter();
  // Hive.registerAdapter(UserModelAdapter());
  // await Hive.openBox<UserModel>(StorageKeys.userInfoBox);
  // ------
  // Hive.registerAdapter(CurrentLocationModelAdapter());
  // await Hive.openBox<CurrentLocationModel>(StorageKeys.currentLocation );
  // Hive.registerAdapter(LocationListModelAdapter());
  // await Hive.openBox<LocationListModel>(StorageKeys.locationList );
  Bloc.observer = MyBlocObserver();

  runApp(
    // DevicePreview(
    // enabled: !kReleaseMode,
    // builder: (context) =>
    const MassaratAlnahda(),
    //  MaterialApp(
    //   home: MyWidget(),
    //  )
    // ),
  );
}

// Future<void> initializeOneSignal() async {
//    WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   // Enable verbose logging for debugging (remove in production)
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//   // Initialize with your OneSignal App ID
//   OneSignal.initialize("cd67a337-6c61-4303-8b6f-dead5d10fba9");
//   // Use this method to prompt for push notifications.
//   // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
//   OneSignal.Notifications.requestPermission(true);
// }
