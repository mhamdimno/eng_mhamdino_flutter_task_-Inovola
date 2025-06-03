import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDto {
  @JsonKey(name: 'id_number')
  final String? idNumber;
  final String? mobile;
  @JsonKey(name: 'project_uuid')
  final String? projectUuid;
  final String? email;

  LoginDto({this.email, this.mobile, this.projectUuid, this.idNumber});

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  LoginDto copyWith({String? email, String? mobile, String? projectUuid, String? idNumber}) {
    return LoginDto(
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      projectUuid: projectUuid ?? this.projectUuid,
      idNumber: idNumber ?? this.idNumber,
    );
  }

}
