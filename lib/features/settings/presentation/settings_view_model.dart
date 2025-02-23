import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simubank/core/navigation/app_router.dart';
import 'package:simubank/features/login/data/providers/user_provider.dart';
import 'package:simubank/features/settings/presentation/settings_screen_state.dart';
import 'package:simubank/core/presentation/theme/theme_mode_provider.dart';

part 'settings_view_model.g.dart';

@riverpod
class SettingsViewModel extends _$SettingsViewModel {
  @override
  SettingsScreenState build() {
    final isDarkTheme = ref.watch(themeModeProvider) == ThemeMode.dark;
    return SettingsScreenState(isDarkTheme: isDarkTheme);
  }

  late final _router = ref.read(routerProvider);
  late final _themeModeProvider = ref.read(themeModeProvider.notifier);
  late final _userProvider = ref.read(userProvider.notifier);

  void onDarkThemeChanged(bool isDarkTheme) {
    _themeModeProvider.onModeChanged(
      isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    );
  }

  Future<void> logout() async {
    _userProvider.state = null;
    _router.pushAndPopUntil(
      const LoginRoute(),
      predicate: (route) => false,
    );
  }
}
