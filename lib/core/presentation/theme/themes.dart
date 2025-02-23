import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simubank/generated/fonts.gen.dart';
import 'package:simubank/core/presentation/theme/app_colors.dart';
import 'package:simubank/core/presentation/theme/text_themes.dart';

class Themes {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: FontFamily.productSans,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextThemes.lightTextTheme,
      inputDecorationTheme: inputDecorationTheme,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        primaryFixed: AppColors.headlineText,
        onPrimaryContainer: Colors.white,
        surface: AppColors.surface,
        secondary: AppColors.secondary,
        error: AppColors.error,
        onError: Colors.white,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: FontFamily.productSans,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      inputDecorationTheme: inputDecorationTheme,
      textTheme: TextThemes.darkTextTheme,
      colorScheme: ColorScheme.dark(
        primary: Colors.white,
        primaryFixed: Colors.white,
        onPrimaryContainer: Colors.white,
        surface: AppColors.surfaceDark,
        secondary: AppColors.secondaryDark,
        error: AppColors.error,
        onError: Colors.white,
      ),
    );
  }

  static const lightOverlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.primaryContainer,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  static const darkOverlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.primaryContainerDark,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  static const inputDecorationTheme = InputDecorationTheme(
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    suffixIconColor: AppColors.primary,
  );

  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(width: 1, color: AppColors.textFieldBorder),
  );
}
