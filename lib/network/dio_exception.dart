import 'package:dio/dio.dart';

//common exception for all the network calls
class DioExceptionRepo implements Exception {
  DioExceptionRepo.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        message = "Connection to API server failed due to network connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(dioError);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  String _handleError(DioException dioError) {
    switch (dioError.response!.statusCode) {
      case 400:
        {

            return dioError.response!.data["message"] != null
                ? dioError.response!.data["message"].toString()
                : dioError.response!.data["data"]["message"].toString();
        }
      case 401:
        return dioError.response!.data["message"] != null
            ? dioError.response!.data["message"].toString()
            : 'Something went wrong';
      case 404:
        return dioError.response!.data["message"] != null
            ? dioError.response!.data["message"].toString()
            : 'Something went wrong';
      case 500:
        return 'Internal server error';
      case 410:
        return dioError.response!.data["message"] != null
            ? dioError.response!.data["message"].toString()
            : 'Something went wrong';
      case 409:
        return dioError.response!.data["message"] != null
            ? dioError.response!.data["message"].toString()
            : 'Something went wrong';
      case 408:
        return dioError.response!.data["message"] != null
            ? dioError.response!.data["message"].toString()
            : 'Something went wrong';
      default:
        return 'Something went wrong';
    }
  }

  @override
  String toString() => message;
}
