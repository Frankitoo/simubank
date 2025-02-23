import 'package:simubank/generated/locale_keys.g.dart';

abstract class ServiceErrors {
  static const unknown = 'UNKNOWN';
  static const timeout = 'TIMEOUT';
  static const networkConnectionError = 'NETWORK_CONNECTION_ERROR';

  static const Map<String, String> serviceErrorMap = {
    unknown: LocaleKeys.unknownError,
    networkConnectionError: LocaleKeys.networkConnectionError,
    timeout: LocaleKeys.timeoutError,
  };
}
