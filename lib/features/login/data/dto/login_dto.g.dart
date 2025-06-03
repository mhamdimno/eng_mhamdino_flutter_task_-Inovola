// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      projectUuid: json['project_uuid'] as String?,
      idNumber: json['id_number'] as String?,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'id_number': instance.idNumber,
      'mobile': instance.mobile,
      'project_uuid': instance.projectUuid,
      'email': instance.email,
    };
