import '../cache/app_prefs.dart';
import '../service_locator/service_locator.dart';
import 'api_constants.dart';
import 'network_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioService {
  late Dio _dio;

  static Map<String, String> headers = {
    ApiHeaders.contentType: ApiHeaders.applicationJson,
    ApiHeaders.accept: ApiHeaders.applicationJson,
  };

  DioService() {
    _setUpDioConfig();
    _addPrettyLoggerInterceptor();
    _addNetworkInterceptor();
    _addTokenInterceptor();
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(
      endPoint,
      queryParameters: query,
    );
  }

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
    );
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.delete(
      endPoint,
      queryParameters: query,
    );
  }

  void _setUpDioConfig() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: headers,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(milliseconds: 3600),
        receiveTimeout: const Duration(milliseconds: 3600),
      ),
    );
  }

  void _addPrettyLoggerInterceptor() {
    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  void _addNetworkInterceptor() {
    _dio.interceptors.add(
      NetWrokInterceptor(getIt<NetworkInfo>()),
    );
  }

  void _addTokenInterceptor() {
    final appPrefs = getIt<AppPrefs>();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          String accessToken = appPrefs.getToken();
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
      ),
    );
  }
}
