// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseFailureModelImpl _$$ApiResponseFailureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiResponseFailureModelImpl(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ApiFailureMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ApiResponseFailureModelImplToJson(
        _$ApiResponseFailureModelImpl instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
    };
