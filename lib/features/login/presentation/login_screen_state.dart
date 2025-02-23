import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_state.freezed.dart';

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    @Default(false) bool isLoading,
    @Default('') String version,
  }) = _LoginScreenState;

  const LoginScreenState._();
}
