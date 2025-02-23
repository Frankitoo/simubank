import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simubank/features/transactions/data/api/transactions_api.dart';
import 'package:simubank/features/transactions/domain/model/transaction.dart';
import 'package:simubank/features/transactions/domain/repository/transactions_repository.dart';

part 'transactions_repository_impl.g.dart';

@riverpod
TransactionsRepository transactionsRepository(ref) =>
    TransactionsRepositoryImpl(
      transactionsApi: ref.watch(transactionsApiProvider),
    );

class TransactionsRepositoryImpl implements TransactionsRepository {
  TransactionsRepositoryImpl({
    required this.transactionsApi,
  });

  final TransactionsApi transactionsApi;

  @override
  Future<List<Transaction>> fetchTransactions({
    required int userId,
    required int page,
    required int limit,
  }) async =>
      await transactionsApi.fetchTransactions(
        userId: userId,
        page: page,
        limit: limit,
      );
}
