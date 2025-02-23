import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simubank/core/data/api/client/api_client.dart';
import 'package:simubank/features/login/domain/model/user.dart';

part 'user_api.g.dart';

@riverpod
UserApi userApi(ref) => UserApi(
      apiClient: ref.watch(apiClientProvider),
    );

class UserApi {
  static const String userPath = '/users';

  UserApi({required this.apiClient});

  final ApiClient apiClient;

  Future<User?> getUser({
    required String email,
  }) async {
    Response response = await apiClient.get(
      userPath,
      queryParameters: {
        'email': email,
      },
    );
    List<User> users =
        (response.data as List).map((i) => User.fromJson(i)).toList();
    return users.firstOrNull;
  }
}
