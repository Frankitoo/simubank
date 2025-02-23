import 'package:simubank/features/login/domain/model/user.dart';

abstract class LoginRepository {
  Future<User?> login({
    required String email,
  });
}
