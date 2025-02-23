// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      date: json['date'] as String,
      merchant: json['merchant'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      description: json['description'] as String,
      fromAccount: json['from_account'] as String,
      toAccount: json['to_account'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date,
      'merchant': instance.merchant,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'from_account': instance.fromAccount,
      'to_account': instance.toAccount,
      'category': instance.category,
    };
