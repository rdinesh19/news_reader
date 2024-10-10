import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../component/toast_msg.dart';
import '../constant/endpoints.dart';
import 'dio_exception.dart';



//client for token apis
Future<Dio> userClient() async {


  final dio = Dio();
  dio.interceptors.clear();
  dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {

    return handler.next(options);
  },
          onResponse: (Response response, handler) {
        Logger().i('url=${baseUrl+response.requestOptions.path}');
        Logger().i('response=$response');
            // Do something with response data
    return handler.next(response); // continue
  }, onError: (DioException error, handler) async {
        if(error.response != null &&
            error.response!.statusCode == 401){
          /// no need show token expiry message
        }
        else {
          print(error.toString());

          showtoast(DioExceptionRepo.fromDioError(error).toString());}


    if (error.response != null) {

      print('error.response=${error.response}');
      print('error.response=${error.response?.realUri}');
      if (error.response!.statusCode == 401) {
        try {
          final dio = Dio();
          dio.interceptors.clear();
            final response = await dio.post(
            baseUrl);

          final opts = Options(
              method: error.requestOptions.method,
              headers: error.requestOptions.headers);
          final cloneReq = await dio.request(baseUrl+error.requestOptions.path,
              options: opts,
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters);
          return handler.resolve(cloneReq);
        } on DioException catch (e) {
          showtoast('Session Expired');
                }
      }
    }
    return handler.next(error);
  }));
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(milliseconds: 120000);
  dio.options.receiveTimeout = const Duration(milliseconds: 120000);
  return dio;
}
