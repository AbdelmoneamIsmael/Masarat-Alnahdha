// import 'dart:io';

// import 'package:dio/dio.dart';
// import '../../core/const/app_const.dart';
// import '../../core/utills/dio_manager.dart';

// class ApiServer {
//   final Dio dioManager;
//   ApiServer({required this.dioManager});

//   /// get request from api
//   Future<Map<String, dynamic>> get({
//     required String endPoint,
//     // String? lang,
//     Map<String, String>? additionalHeaders,
//   }) async {
//     Map<String, String> headers = {"Accept-Language": getHeaderLang()};

//     if (additionalHeaders != null) {
//       headers.addAll(additionalHeaders);
//     }

//     dioManager.options.headers.addAll(headers);

//     Response response = await dioManager.get(endPoint);
//     return response.data;
//   }

//   ///cheek internet connection

//   Future<bool> cheekInterentConnection() async {
//     try {
//       final foo = await InternetAddress.lookup('google.com');
//       return foo.isNotEmpty && foo[0].rawAddress.isNotEmpty ? true : false;
//     } catch (e) {
//       return false;
//     }
//   }

//   /// post request from api
//   Future<Map<String, dynamic>> post({
//     required String endPoint,
//     // String? lang,
//     Object? data,
//     // Map<String, String>? additionalHeaders,
//     // bool? requestWithToken = true,
//   }) async {
//     Map<String, String> headers =
//         // additionalHeaders ??
//         {
//           // "Accept-Language": getHeaderLang(),
//         };

//     String url = baseUrl + endPoint;
//     dioManager.options.headers = headers;
//     var response = await dioManager.post(url, data: data);

//     if (response.data is String) {
//       return {"message": response.data};
//     }
//     return response.data;
//   }
// }
