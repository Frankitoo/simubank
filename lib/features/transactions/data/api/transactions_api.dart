import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simubank/core/data/api/client/api_client.dart';
import 'package:simubank/features/transactions/data/api/model/transactions_request.dart';
import 'package:simubank/features/transactions/domain/model/transaction.dart';

part 'transactions_api.g.dart';

@riverpod
TransactionsApi transactionsApi(ref) => TransactionsApi(
      apiClient: ref.watch(apiClientProvider),
    );

class TransactionsApi {
  static const String transactionsPath = '/transactions';

  TransactionsApi({required this.apiClient});

  final ApiClient apiClient;

  Future<List<Transaction>> fetchTransactions({
    required int userId,
    required int page,
    required int limit,
  }) async {
    Response response = await apiClient.get(transactionsPath,
        queryParameters: TransactionsRequest(
          userId: userId,
          page: page,
          limit: limit,
        ).toJson());
    List<Transaction> transactions =
        (response.data as List).map((i) => Transaction.fromJson(i)).toList();
    return transactions;
  }
}
