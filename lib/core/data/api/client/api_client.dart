import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simubank/core/data/api/client/error_handler_interceptor.dart';

part 'api_client.g.dart';

const String baseUrl = 'https://my-json-server.typicode.com/vborbely/SimuBank';
const String applicationJson = "application/json";

@riverpod
ApiClient apiClient(ref) => ApiClient();

class ApiClient {
  ApiClient() {
    _dio = getClient(baseUrl);
  }

  late Dio _dio;

  Dio getClient(String baseUrl) {
    final timeout = const Duration(seconds: 10);
    final options = BaseOptions(
      baseUrl: baseUrl,
      contentType: applicationJson,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      sendTimeout: timeout,
    );

    final dio = Dio(options)
      ..interceptors.addAll([
        ErrorHandlerInterceptor(),
      ]);

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final callQueryParameters = queryParameters ?? <String, dynamic>{};
    return _dio.get(
      path,
      queryParameters: callQueryParameters,
    );
  }
}
