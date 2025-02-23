import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simubank/core/navigation/app_router.dart';
import 'package:simubank/features/login/data/providers/user_provider.dart';
import 'package:simubank/features/login/data/repository/login_repository_impl.dart';
import 'package:simubank/features/login/presentation/login_screen_state.dart';
import 'package:simubank/generated/locale_keys.g.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginScreenState build() {
    _getVersionInfo();
    ref.onDispose(_onDispose);
    return const LoginScreenState();
  }

  late final _loginRepository = ref.read(loginRepositoryProvider);
  late final _router = ref.read(routerProvider);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _getVersionInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final String year = DateTime.now().year.toString();
    final version =
        '© $year ${LocaleKeys.simuBankVersion.tr()} ${packageInfo.version}.${packageInfo.buildNumber}';
    state = state.copyWith(version: version);
  }

  Future<void> onLoginPressed() async {
    if (!_validateEmail()) {
      return;
    }
    if (!_validatePassword()) {
      return;
    }
    try {
      state = state.copyWith(isLoading: true);
      final user = await _loginRepository.login(email: emailController.text);
      if (user == null) {
        _router.showErrorSnackBar(title: LocaleKeys.invalidCredentials.tr());
        return;
      } else {
        ref.read(userProvider.notifier).state = user;
        _router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (route) => false,
        );
      }
    } catch (error) {
      _router.showErrorSnackBar(title: error.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  bool _validateEmail() {
    if (emailController.text.isEmpty) {
      _router.showErrorSnackBar(title: LocaleKeys.emailIsRequired.tr());
      return false;
    } else if (!_isValidEmail()) {
      _router.showErrorSnackBar(title: LocaleKeys.invalidEmail.tr());
      return false;
    }
    return true;
  }

  bool _isValidEmail() {
    final emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    return regex.hasMatch(emailController.text);
  }

  bool _validatePassword() {
    if (passwordController.text.isEmpty) {
      _router.showErrorSnackBar(title: LocaleKeys.passwordIsRequired.tr());
      return false;
    }
    return true;
  }

  void _onDispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
