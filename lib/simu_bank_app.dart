import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/navigation/app_router.dart';
import 'package:simubank/core/presentation/theme/theme_mode_provider.dart';
import 'package:simubank/core/presentation/theme/themes.dart';

class SimuBankApp extends ConsumerWidget {
  const SimuBankApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    ref.read(themeModeProvider.notifier).setOverlayTheme(themeMode: themeMode);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
      builder: (ctx, child) => child!,
      theme: Themes.light(),
      darkTheme: Themes.dark(),
      themeMode: themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
