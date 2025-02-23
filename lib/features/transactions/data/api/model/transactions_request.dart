import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_request.g.dart';

@JsonSerializable()
class TransactionsRequest {
  final int userId;
  @JsonKey(name: '_page')
  final int page;
  @JsonKey(name: '_limit')
  final int limit;

  TransactionsRequest({
    required this.userId,
    required this.page,
    required this.limit,
  });

  factory TransactionsRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsRequestToJson(this);
}
