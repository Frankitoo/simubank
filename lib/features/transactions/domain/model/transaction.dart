import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final int id;
  final int userId;
  final String date;
  final String merchant;
  final int amount;
  final String currency;
  final String description;
  @JsonKey(name: 'from_account')
  final String fromAccount;
  @JsonKey(name: 'to_account')
  final String toAccount;
  final String category;

  Transaction({
    required this.id,
    required this.userId,
    required this.date,
    required this.merchant,
    required this.amount,
    required this.currency,
    required this.description,
    required this.fromAccount,
    required this.toAccount,
    required this.category,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
