import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_screen_state.freezed.dart';

@freezed
class SettingsScreenState with _$SettingsScreenState {
  const factory SettingsScreenState({
    @Default(false) bool isDarkTheme,
  }) = _SettingsScreenState;

  const SettingsScreenState._();
}
