// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) =>
    CurrencyResponse();

Map<String, dynamic> _$CurrencyResponseToJson(CurrencyResponse instance) =>
    <String, dynamic>{};

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      code: json['code'] as String,
      value: (json['value'] as num).toDouble(),
    )..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'value': instance.value,
    };
