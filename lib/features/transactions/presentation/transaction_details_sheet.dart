import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/navigation/app_router.dart';
import 'package:simubank/features/transactions/domain/model/transaction.dart';
import 'package:simubank/features/transactions/presentation/amount_currency.dart';
import 'package:simubank/features/transactions/presentation/transaction_detail_info_row.dart';
import 'package:simubank/generated/locale_keys.g.dart';

void showTransactionDetailsSheet(
  BuildContext context,
  Transaction transaction,
) async {
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    enableDrag: true,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) {
      return TransactionDetailsSheet(transaction: transaction);
    },
  );
}

class TransactionDetailsSheet extends ConsumerWidget {
  const TransactionDetailsSheet({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: colorScheme.primary,
                  ),
                  onPressed: () => router.popForced(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.transactionDetails.tr(),
                    style: textTheme.headlineLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          transaction.description,
                          style: textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: AmountCurrencyText(
                            amount: transaction.amount,
                            currency: transaction.currency,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TransactionDetailInfoRow(
                    label: LocaleKeys.date.tr(),
                    value: transaction.date.toString(),
                  ),
                  const SizedBox(height: 12),
                  TransactionDetailInfoRow(
                    label: LocaleKeys.merchant.tr(),
                    value: transaction.merchant.toString(),
                  ),
                  const SizedBox(height: 12),
                  TransactionDetailInfoRow(
                    label: LocaleKeys.category.tr(),
                    value: transaction.category.toString(),
                  ),
                  const SizedBox(height: 12),
                  TransactionDetailInfoRow(
                    label: LocaleKeys.toAccount.tr(),
                    value: transaction.toAccount.toString(),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
