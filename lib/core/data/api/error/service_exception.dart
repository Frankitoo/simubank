import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:simubank/core/data/api/error/service_errors.dart';
import 'package:simubank/generated/locale_keys.g.dart';

class ServiceException extends DioException {
  final String errorName;
  String? errorMessage;

  ServiceException({
    required RequestOptions options,
    required this.errorName,
    this.errorMessage,
  }) : super(requestOptions: options) {
    errorMessage ??= ServiceErrors.serviceErrorMap[errorName]?.tr() ??
        LocaleKeys.unknownError.tr();
  }

  @override
  String toString() {
    return errorMessage ?? LocaleKeys.unknownError.tr();
  }
}
