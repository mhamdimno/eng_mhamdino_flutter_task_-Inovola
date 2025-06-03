import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_version_model.freezed.dart';

part 'last_version_model.g.dart';

@Freezed(fromJson: true)
class LastVersionModel with _$LastVersionModel {
  factory LastVersionModel({
    String? appVersion,
  }) = _LastVersionModel;

  factory LastVersionModel.fromJson(Map<String, dynamic> json) => _$LastVersionModelFromJson(json);
}
