import 'package:flutter/material.dart';
import 'package:simubank/features/transactions/domain/model/transaction.dart';
import 'package:simubank/features/transactions/presentation/amount_currency.dart';
import 'package:simubank/features/transactions/presentation/transaction_details_sheet.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        showTransactionDetailsSheet(context, transaction);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.date,
                  style: textTheme.bodyLarge,
                ),
                const Spacer(),
                AmountCurrencyText(
                  amount: transaction.amount,
                  currency: transaction.currency,
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              transaction.description,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
