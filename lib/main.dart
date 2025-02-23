import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/localization/localization_utils.dart';
import 'package:simubank/simu_bank_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationUtils.supportedLocales,
      path: LocalizationUtils.translationsPath,
      fallbackLocale: LocalizationUtils.defaultLocale,
      child: ProviderScope(
        child: const SimuBankApp(),
      ),
    ),
  );
}
