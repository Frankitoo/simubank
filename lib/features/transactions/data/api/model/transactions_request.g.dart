// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsRequest _$TransactionsRequestFromJson(Map<String, dynamic> json) =>
    TransactionsRequest(
      userId: (json['userId'] as num).toInt(),
      page: (json['_page'] as num).toInt(),
      limit: (json['_limit'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionsRequestToJson(
        TransactionsRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      '_page': instance.page,
      '_limit': instance.limit,
    };
