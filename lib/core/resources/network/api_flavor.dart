import 'package:dio/dio.dart';

class EQuranApi {
  Future<Dio> get(bool withHeader, Map<String, dynamic>? header) async {
    var dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 120000),
      receiveTimeout: const Duration(milliseconds: 120000),
      headers: header,
      responseType: ResponseType.json,
    ));

    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
    return dio;
  }

  Future<Dio> getMultipart(
    bool withHeader,
    Map<String, dynamic>? header,
  ) async {
    var dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 120000),
      receiveTimeout: const Duration(milliseconds: 120000),
      headers: header,
      responseType: ResponseType.plain,
    ));

    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
    dio.interceptors.add(LogInterceptor(requestBody: true));
    return dio;
  }

  Map<String, dynamic> setHeader() {
    return {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
  }

  Map<String, dynamic> setHeaderWithAuth(String auth) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $auth',
    };
  }

  Future<Map<String, dynamic>> setHeaderMultipartWithAuth(String auth) async {
    return {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $auth',
    };
  }
}
