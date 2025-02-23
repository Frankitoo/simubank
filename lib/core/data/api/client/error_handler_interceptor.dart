import 'package:dio/dio.dart';
import 'package:simubank/core/data/api/error/service_errors.dart';
import 'package:simubank/core/data/api/error/service_exception.dart';

class ErrorHandlerInterceptor extends QueuedInterceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return handler.next(ServiceException(
          options: err.requestOptions,
          errorName: ServiceErrors.timeout,
        ));
      case DioExceptionType.cancel:
        return;
      case DioExceptionType.badResponse:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return handler.next(ServiceException(
          options: err.requestOptions,
          errorName: ServiceErrors.networkConnectionError,
        ));
    }
  }
}
