// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LastVersionModel _$LastVersionModelFromJson(Map<String, dynamic> json) {
  return _LastVersionModel.fromJson(json);
}

/// @nodoc
mixin _$LastVersionModel {
  String? get appVersion => throw _privateConstructorUsedError;

  /// Serializes this LastVersionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LastVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LastVersionModelCopyWith<LastVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastVersionModelCopyWith<$Res> {
  factory $LastVersionModelCopyWith(
          LastVersionModel value, $Res Function(LastVersionModel) then) =
      _$LastVersionModelCopyWithImpl<$Res, LastVersionModel>;
  @useResult
  $Res call({String? appVersion});
}

/// @nodoc
class _$LastVersionModelCopyWithImpl<$Res, $Val extends LastVersionModel>
    implements $LastVersionModelCopyWith<$Res> {
  _$LastVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LastVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = freezed,
  }) {
    return _then(_value.copyWith(
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastVersionModelImplCopyWith<$Res>
    implements $LastVersionModelCopyWith<$Res> {
  factory _$$LastVersionModelImplCopyWith(_$LastVersionModelImpl value,
          $Res Function(_$LastVersionModelImpl) then) =
      __$$LastVersionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? appVersion});
}

/// @nodoc
class __$$LastVersionModelImplCopyWithImpl<$Res>
    extends _$LastVersionModelCopyWithImpl<$Res, _$LastVersionModelImpl>
    implements _$$LastVersionModelImplCopyWith<$Res> {
  __$$LastVersionModelImplCopyWithImpl(_$LastVersionModelImpl _value,
      $Res Function(_$LastVersionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LastVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = freezed,
  }) {
    return _then(_$LastVersionModelImpl(
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LastVersionModelImpl implements _LastVersionModel {
  _$LastVersionModelImpl({this.appVersion});

  factory _$LastVersionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastVersionModelImplFromJson(json);

  @override
  final String? appVersion;

  @override
  String toString() {
    return 'LastVersionModel(appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastVersionModelImpl &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appVersion);

  /// Create a copy of LastVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LastVersionModelImplCopyWith<_$LastVersionModelImpl> get copyWith =>
      __$$LastVersionModelImplCopyWithImpl<_$LastVersionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LastVersionModelImplToJson(
      this,
    );
  }
}

abstract class _LastVersionModel implements LastVersionModel {
  factory _LastVersionModel({final String? appVersion}) =
      _$LastVersionModelImpl;

  factory _LastVersionModel.fromJson(Map<String, dynamic> json) =
      _$LastVersionModelImpl.fromJson;

  @override
  String? get appVersion;

  /// Create a copy of LastVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LastVersionModelImplCopyWith<_$LastVersionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
