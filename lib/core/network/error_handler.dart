import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.unknown.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch (error.response?.statusCode) {
      case ResponseCode.noInternetConnection:
        return DataSource.noInternetConnection.getFailure();
      case ResponseCode.badRequest:
        return _handleBadResponse(error);
      case ResponseCode.unauthorised:
        return DataSource.unauthorised.getFailure();
      case ResponseCode.notFound:
        return DataSource.notFound.getFailure();
      case ResponseCode.forbidden:
        return DataSource.forbidden.getFailure();
      case ResponseCode.internalServerError:
        return DataSource.internalServerError.getFailure();
      case ResponseCode.connectTimeout:
        return DataSource.connectTimeout.getFailure();
      case ResponseCode.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case ResponseCode.recieveTimeout:
        return DataSource.recieveTimeout.getFailure();
      case ResponseCode.cancel:
        return DataSource.cancel.getFailure();
      case ResponseCode.cacheError:
        return DataSource.cacheError.getFailure();

      default:
        return DataSource.unknown.getFailure();
    }
  }

  Failure _handleBadResponse(DioException error) {
    final resposne = error.response;
    if (resposne != null &&
        resposne.statusCode != null &&
        resposne.statusMessage != null) {
      return Failure.fromJson(resposne.data);
    } else {
      return DataSource.badRequest.getFailure();
    }
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  recieveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
          code: ResponseCode.success,
          message: ResponseMessage.success,
        );
      case DataSource.noContent:
        return Failure(
          code: ResponseCode.noContent,
          message: ResponseMessage.noContent,
        );
      case DataSource.badRequest:
        return Failure(
          code: ResponseCode.badRequest,
          message: ResponseMessage.badRequest,
        );
      case DataSource.forbidden:
        return Failure(
          code: ResponseCode.forbidden,
          message: ResponseMessage.forbidden,
        );
      case DataSource.unauthorised:
        return Failure(
          code: ResponseCode.unauthorised,
          message: ResponseMessage.unauthorised,
        );
      case DataSource.notFound:
        return Failure(
          code: ResponseCode.notFound,
          message: ResponseMessage.notFound,
        );
      case DataSource.internalServerError:
        return Failure(
          code: ResponseCode.internalServerError,
          message: ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return Failure(
          code: ResponseCode.connectTimeout,
          message: ResponseMessage.connectTimeout,
        );
      case DataSource.cancel:
        return Failure(
          code: ResponseCode.cancel,
          message: ResponseMessage.cancel,
        );
      case DataSource.recieveTimeout:
        return Failure(
          code: ResponseCode.recieveTimeout,
          message: ResponseMessage.recieveTimeout,
        );
      case DataSource.sendTimeout:
        return Failure(
          code: ResponseCode.sendTimeout,
          message: ResponseMessage.sendTimeout,
        );
      case DataSource.cacheError:
        return Failure(
          code: ResponseCode.cacheError,
          message: ResponseMessage.cacheError,
        );
      case DataSource.noInternetConnection:
        return Failure(
          code: ResponseCode.noInternetConnection,
          message: ResponseMessage.noInternetConnection,
        );
      case DataSource.unknown:
        return Failure(
          code: ResponseCode.unknown,
          message: ResponseMessage.unknown,
        );
    }
  }
}

class ResponseCode {
  ResponseCode._();

  /// external status code
  static const success = 200; // success with data
  static const noContent = 201; // success without data
  static const badRequest = 400; // bad request from client side (validation)
  static const unauthorised = 401; // user is not authorised
  static const forbidden = 403; // user is not allowed to access
  static const notFound = 404; // not found
  static const internalServerError = 500; // crash in server side

  /// local status code
  static const connectTimeout = -1;
  static const cancel = -2;
  static const recieveTimeout = -3;
  static const sendTimeout = -4;
  static const cacheError = -5;
  static const noInternetConnection = -6;
  static const unknown = -7;
}

class ResponseMessage {
  ResponseMessage._();

  /// remote status message
  static const success = "success";
  static const noContent = "success";
  static const badRequest = "Bad request, Try again later";
  static const unauthorised = "User is unauthorised, Try again later";
  static const forbidden = "Forbidden request, Try again later";
  static const notFound = "Not found, Try again later";
  static const internalServerError = "Some thing went wrong, Try again later";

  /// local status message
  static const connectTimeout = "Time out error, Try again later";
  static const cancel = "Request was cancelled, Try again later";
  static const recieveTimeout = "Time out error, Try again later";
  static const sendTimeout = "Time out error, Try again later";
  static const cacheError = "Cache error, Try again later";
  static const noInternetConnection = "Please check your internet connection";
  static const unknown = "Some thing went wrong, Try again later";
}

class ApiInternalStatus {
  ApiInternalStatus._();

  static const success = 0;
  static const failure = 1;
}
