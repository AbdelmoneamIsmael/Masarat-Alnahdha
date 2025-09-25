// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/Material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> handleBackGroundMessage(RemoteMessage message) async {
//   debugPrint("Title: ${message.notification!.title}");
//   debugPrint("Body: ${message.notification!.body}");
//   debugPrint("payload: ${message.data}");
// }

// class PushNotificationControllerWithFirebase {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   final _androidChannel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: "This channel is used for important notifications ",
//     importance: Importance.max,
//     enableLights: true,
//     enableVibration: true,
//     ledColor: Colors.red,
//     playSound: true,
//     showBadge: true,
//   );
//   final _localNotification = FlutterLocalNotificationsPlugin();

//   Future<void> initNotifications() async {
//     _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();

//     setDeviceId(fCMToken);
//     // print('fcm token is $fCMToken');
//     await initPushNotifications();
//     await initLocalNotification();
//   }

//   setDeviceId(String? deviceId) async {
//     // FullAppStudentController.get(navigatorKey.currentState!.context,
//     //         listen: false)
//     //     .setDeviceId(deviceId);
//   }

//   void handelMessage(RemoteMessage? message) {
//     // Get.to(()=>BottomNavigation());

//     if (message == null) return;
//     String type = message.data['type'];
//     if (type == 'B') {
//       navigateToNotification(); //'opened app'
//     }
//   }

//   void handelTerminatedMessage(RemoteMessage? message) {
//     if (message == null) return;
//     // Get.to(()=>BottomNavigation());

//     String type = message.data['type'];
//     if (type == 'B') {
//       navigateToNotification(); //'opened app'
//     }

//     // Navigator.push(
//     //     navigatorKey.currentState!.context,
//     //     MaterialPageRoute(
//     //         builder: (_) => TestNotificationPage(
//     //               title: remoteMessageData['title'],
//     //               lessonId: remoteMessageData["LessonId"],
//     //               videoId: remoteMessageData['VedioId'],
//     //             ),),);
//     // BottomNavbarNotifier.get(navigatorKey.currentState!.context, listen: false)
//     //     .setRemoteMessage(remoteMessageData);
//   }

//   Future<void> initPushNotifications() async {
//     await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     _firebaseMessaging.getInitialMessage().then(handelTerminatedMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
//     FirebaseMessaging.onMessage.listen((message) {
//       RemoteNotification? notification = message.notification;
//       if (notification == null) return;
//       showLocalNotification(message);
//     });
//   }

//   Future<void> initLocalNotification() async {
//     const iOS = DarwinInitializationSettings();
//     const android = AndroidInitializationSettings('app_icon');
//     const settings = InitializationSettings(android: android, iOS: iOS);

//     await _localNotification.initialize(
//       settings,
//       onDidReceiveNotificationResponse: selectNotification,
//     );
//     final platform =
//         _localNotification
//             .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin
//             >();
//     await platform!.createNotificationChannel(_androidChannel);
//   }

//   showLocalNotification(RemoteMessage message) {
//     _localNotification.show(
//       message.notification.hashCode,
//       message.notification!.title,
//       message.notification!.body,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           "1",
//           "channel",
//           channelDescription: "description",
//           icon: 'app_icon',
//           playSound: true,
//           importance: Importance.max,
//           priority: Priority.max,
//           chronometerCountDown: true,
//           enableLights: true,
//           enableVibration: true,
//           showProgress: true,
//           channelShowBadge: true,
//           ledColor: Colors.red,
//           ledOnMs: 1000,
//           ledOffMs: 1000,
//         ),
//       ),
//       payload: jsonEncode(message.toMap()),
//     );
//   }

//   void selectNotification(NotificationResponse notificationResponse) async {
//     final message = RemoteMessage.fromMap(
//       jsonDecode(notificationResponse.payload!),
//     );
//     handelMessage(message);
//   }
// }

// navigateToNotification() {
//   //  Get.to(()=>BottomNavigation());
//   // Navigator.push(
//   //   navigatorKey.currentState!.context,
//   //   MaterialPageRoute(
//   //     builder: (_) => BlocProvider(
//   //         create: (BuildContext context) => NotificationCubit(),
//   //         child: const NotificationScreen()),
//   //   ),
//   // );
// }
