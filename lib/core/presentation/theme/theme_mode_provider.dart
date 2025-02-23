import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simubank/core/presentation/theme/themes.dart';

final themeModeProvider = StateNotifierProvider<ThemeViewModel, ThemeMode>(
  (ref) => ThemeViewModel(),
  name: 'Theme mode',
);

class ThemeViewModel extends StateNotifier<ThemeMode> {
  ThemeViewModel() : super(ThemeMode.system) {
    fetchThemeMode();
  }

  static const String themeKey = 'theme_mode';

  Future<void> fetchThemeMode() async {
    final pref = await SharedPreferences.getInstance();
    state = ThemeMode.values[pref.getInt(themeKey) ?? 0];
  }

  Future<void> onModeChanged(ThemeMode mode) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt(themeKey, mode.index);
    state = mode;
    setOverlayTheme(themeMode: mode);
  }

  void setOverlayTheme({ThemeMode? themeMode}) {
    bool isDarkMode;
    final updateThemeMode = themeMode ?? state;
    if (updateThemeMode == ThemeMode.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      isDarkMode = brightness == Brightness.dark;
    } else {
      isDarkMode = updateThemeMode == ThemeMode.dark;
    }
    SystemChrome.setSystemUIOverlayStyle(
      isDarkMode ? Themes.darkOverlayStyle : Themes.lightOverlayStyle,
    );
  }
}
