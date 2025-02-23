import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_screen_state.freezed.dart';

@freezed
class TransactionsScreenState with _$TransactionsScreenState {
  const factory TransactionsScreenState({
    @Default('') String searchText,
    @Default('') String? userName,
  }) = _TransactionsScreenState;

  const TransactionsScreenState._();
}
