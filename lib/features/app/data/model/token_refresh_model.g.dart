// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenRefreshModel _$TokenRefreshModelFromJson(Map<String, dynamic> json) =>
    TokenRefreshModel(
      access_token: json['access_token'] as String?,
      refresh_token: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$TokenRefreshModelToJson(TokenRefreshModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };
