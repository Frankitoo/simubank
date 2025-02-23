import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/presentation/theme/app_colors.dart';
import 'package:simubank/core/presentation/theme/theme_mode_provider.dart';

class AmountCurrencyText extends ConsumerWidget {
  final int amount;
  final String currency;
  final double? fontSize;

  const AmountCurrencyText({
    super.key,
    required this.amount,
    required this.currency,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final negativeColor =
        themeMode == ThemeMode.dark ? AppColors.error : AppColors.negativeValue;
    return Text(
      CurrencyFormatter.format(amount, CurrencyFormat.fromCode(currency)!),
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: amount < 0 ? negativeColor : null,
            fontSize: fontSize,
          ),
    );
  }
}
