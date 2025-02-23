import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/presentation/components/primary_button.dart';
import 'package:simubank/features/settings/presentation/settings_view_model.dart';
import 'package:simubank/generated/locale_keys.g.dart';
import 'package:simubank/core/presentation/theme/app_colors.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final viewModel = ref.read(settingsViewModelProvider.notifier);
    final state = ref.watch(settingsViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Text(
                  LocaleKeys.settings.tr(),
                  style: textTheme.displayMedium?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SwitchListTile(
                title: Text(
                  LocaleKeys.darkTheme.tr(),
                  style: textTheme.titleLarge,
                ),
                value: state.isDarkTheme,
                onChanged: viewModel.onDarkThemeChanged,
              ),
              const Spacer(),
              PrimaryButton(
                title: LocaleKeys.logout.tr(),
                onPressed: viewModel.logout,
                backgroundColor: AppColors.error,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
