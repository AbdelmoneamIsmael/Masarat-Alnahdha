// import 'package:dio/dio.dart';
// import '../../core/const/app_const.dart';

// abstract class Failure {
//   final String message;
//   Failure(this.message);
// }

// class ServerFailure extends Failure {
//   ServerFailure(super.message);
//   factory ServerFailure.fromDioError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure(dioExceptiosMessages['connectionTimeout']!);
//       case DioExceptionType.sendTimeout:
//         return ServerFailure(dioExceptiosMessages['sendTimeout']!);
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure(dioExceptiosMessages['receiveTimeout']!);
//       case DioExceptionType.badCertificate:
//         return ServerFailure(dioExceptiosMessages['badCertificate']!);
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(error.response!);
//       case DioExceptionType.cancel:
//         return ServerFailure(dioExceptiosMessages['cancel']!);
//       case DioExceptionType.connectionError:
//         return ServerFailure(dioExceptiosMessages['connectionError']!);
//       case DioExceptionType.unknown:
//         return ServerFailure(dioExceptiosMessages['unknown']!);
//     }
//   }
//   factory ServerFailure.fromResponse(Response response) {
//     if (response.statusCode == 404) {
//       return ServerFailure('${response.data["message"]}');
//     } else if (response.statusCode == 500) {
//       return ServerFailure(response.data["message"]!);
//     } else if (response.statusCode == 401 || response.statusCode == 403) {
//       return ServerFailure(response.data["message"]!);
//     } else if (response.statusCode == 400) {
//       return ServerFailure(
//         response.data["message"] ??
//             response.data["errors"].toString() ??
//             "حدث خطأ ما",
//       );
//     } else {
//       return ServerFailure(response.data["message"] ?? "حدث خطأ ما");
//     }
//   }
// }
