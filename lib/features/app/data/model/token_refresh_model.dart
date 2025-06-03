import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_refresh_model.g.dart';

@JsonSerializable()
class TokenRefreshModel{
  String? access_token;
  String? refresh_token;
  TokenRefreshModel({this.access_token, this.refresh_token});
  factory TokenRefreshModel.fromJson(Map<String, dynamic> json) => _$TokenRefreshModelFromJson(json);
}
