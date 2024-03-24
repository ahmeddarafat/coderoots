import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'error_handler.dart';

class NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfo(this._internetConnectionChecker);

  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}

class NetWrokInterceptor extends Interceptor {
  final NetworkInfo networkInfo;

  NetWrokInterceptor(this.networkInfo);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (await networkInfo.isConnected == false) {
      var error = DioException(
        requestOptions: options,
        response: Response(
          requestOptions: options,
          statusCode: ResponseCode.noInternetConnection,
          statusMessage: ResponseMessage.noInternetConnection,
        ),
      );
      return handler.reject(error);
    }
    return super.onRequest(options, handler);
  }
}
