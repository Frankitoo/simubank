import 'package:simubank/features/transactions/domain/model/transaction.dart';

abstract class TransactionsRepository {
  Future<List<Transaction>> fetchTransactions({
    required int userId,
    required int page,
    required int limit,
  });
}
