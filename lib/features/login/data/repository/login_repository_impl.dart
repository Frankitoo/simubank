import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simubank/features/login/data/api/user_api.dart';
import 'package:simubank/features/login/domain/model/user.dart';
import 'package:simubank/features/login/domain/repository/login_repository.dart';

part 'login_repository_impl.g.dart';

@riverpod
LoginRepository loginRepository(ref) => LoginRepositoryImpl(
      userApi: ref.watch(userApiProvider),
    );

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({
    required this.userApi,
  });

  final UserApi userApi;

  @override
  Future<User?> login({
    required String email,
  }) async =>
      userApi.getUser(email: email);
}
