import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simubank/core/utils/debounce.dart';
import 'package:simubank/features/login/data/providers/user_provider.dart';
import 'package:simubank/features/transactions/data/repository/transactions_repository_impl.dart';
import 'package:simubank/features/transactions/domain/model/transaction.dart';
import 'package:simubank/features/transactions/presentation/transactions_screen_state.dart';

part 'transactions_view_model.g.dart';

@riverpod
class TransactionsViewModel extends _$TransactionsViewModel {
  @override
  TransactionsScreenState build() {
    transactionsPagingController.addPageRequestListener(
      (pageKey) => _fetchTransactions(pageKey: pageKey),
    );
    searchController.addListener(() {
      onSearchChanged();
    });
    ref.onDispose(_onDispose);
    return TransactionsScreenState(userName: _user?.name);
  }

  final PagingController<int, Transaction> transactionsPagingController =
      PagingController(firstPageKey: 1);

  late final _transactionsRepository = ref.read(transactionsRepositoryProvider);
  late final _user = ref.read(userProvider);

  final searchController = TextEditingController();
  final _debounce = Debounce();

  void onSearchChanged() {
    // Keyboard close triggers onChanged - This check prevents it
    if (searchController.text == state.searchText) return;

    _debounce.debounce(() {
      state = state.copyWith(searchText: searchController.text);
      transactionsPagingController.refresh();
    });
  }

  Future<void> refreshTransactions() async {
    transactionsPagingController.refresh();
  }

  Future<void> _fetchTransactions({
    required int pageKey,
  }) async {
    final defaultLimit = 10;
    try {
      if (_user == null) {
        return;
      }
      final transactions = await _transactionsRepository.fetchTransactions(
        userId: _user.id,
        page: pageKey,
        limit: defaultLimit,
      );

      // Search will not work properly until the BE endpoint is not prepared for it.
      // Only the first page is filtered, with this setup.
      final filteredTransactions = transactions.where((transaction) {
        return transaction.description
            .toLowerCase()
            .contains(searchController.text.toLowerCase());
      }).toList();

      final isLastPage = filteredTransactions.length < defaultLimit;
      if (isLastPage) {
        transactionsPagingController.appendLastPage(filteredTransactions);
      } else {
        final nextPageKey = pageKey + 1;
        transactionsPagingController.appendPage(
            filteredTransactions, nextPageKey);
      }
    } catch (error) {
      transactionsPagingController.error = error;
    }
  }

  void _onDispose() {
    searchController.dispose();
    transactionsPagingController.dispose();
  }
}
