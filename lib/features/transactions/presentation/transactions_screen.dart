import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:simubank/core/presentation/components/input_field.dart';
import 'package:simubank/features/transactions/domain/model/transaction.dart';
import 'package:simubank/features/transactions/presentation/transaction_list_item.dart';
import 'package:simubank/features/transactions/presentation/transactions_view_model.dart';
import 'package:simubank/generated/locale_keys.g.dart';
import 'package:simubank/core/presentation/theme/app_colors.dart';

@RoutePage()
class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final viewModel = ref.read(transactionsViewModelProvider.notifier);
    final state = ref.watch(transactionsViewModelProvider);
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
                  LocaleKeys.transactions.tr(),
                  style: textTheme.displayMedium?.copyWith(
                    color: colorScheme.primaryFixed,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 28),
              if (state.userName != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text.rich(
                    TextSpan(
                      text: '${LocaleKeys.hello.tr()}, ',
                      style: textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: state.userName,
                          style: textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '!', // Normal text
                          style: textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
              ],
              Row(
                children: [
                  const SizedBox(width: 8),
                  Icon(
                    Icons.filter_alt_outlined,
                    size: 32,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InputField(
                      hintText: LocaleKeys.search.tr(),
                      controller: viewModel.searchController,
                      suffixIcon: Icon(
                        Icons.search_sharp,
                        size: 32,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: viewModel.refreshTransactions,
                  child: PagedListView.separated(
                    padding: const EdgeInsets.only(bottom: 16),
                    pagingController: viewModel.transactionsPagingController,
                    builderDelegate: PagedChildBuilderDelegate<Transaction>(
                      itemBuilder: (_, transaction, __) =>
                          TransactionListItem(transaction: transaction),
                      noItemsFoundIndicatorBuilder: (_) => Center(
                        child: Text(
                          LocaleKeys.noTransactions.tr(),
                          style: textTheme.headlineMedium?.copyWith(
                            color: colorScheme.primaryFixed,
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (_, __) => const Divider(
                      thickness: 1,
                      color: AppColors.disabledButton,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
