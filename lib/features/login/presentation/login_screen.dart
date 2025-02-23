import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/presentation/components/input_field.dart';
import 'package:simubank/core/presentation/components/primary_button.dart';
import 'package:simubank/features/login/presentation/login_view_model.dart';
import 'package:simubank/generated/assets.gen.dart';
import 'package:simubank/generated/locale_keys.g.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final state = ref.watch(loginViewModelProvider);
    final viewModel = ref.read(loginViewModelProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 560),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Image.asset(
                          Assets.images.simubankLogo.path,
                          width: 108,
                          height: 108,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.simuBank.tr(),
                                style: textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                LocaleKeys.digitalBanking.tr(),
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.secondary,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 48),
                    Text(
                      LocaleKeys.login.tr(),
                      style: textTheme.displayMedium?.copyWith(
                        color: colorScheme.primaryFixed,
                      ),
                    ),
                    const SizedBox(height: 40),
                    InputField(
                      hintText: LocaleKeys.email.tr(),
                      controller: viewModel.emailController,
                    ),
                    const SizedBox(height: 24),
                    InputField(
                      hintText: LocaleKeys.password.tr(),
                      controller: viewModel.passwordController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 24),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: state.isLoading
                          ? SizedBox(
                              height: 56,
                              width: 56,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: SizedBox(
                                  child: const CircularProgressIndicator(),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: PrimaryButton(
                                title: LocaleKeys.login.tr().toUpperCase(),
                                onPressed: viewModel.onLoginPressed,
                              ),
                            ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        LocaleKeys.noAccountYet.tr(),
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      title: LocaleKeys.registration.tr().toUpperCase(),
                      enabled: false,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        state.version,
                        style: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.secondary),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
