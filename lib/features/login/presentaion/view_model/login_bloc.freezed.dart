// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isValid) isFormValid,
    required TResult Function(LoginDto loginDto) loginPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isValid)? isFormValid,
    TResult? Function(LoginDto loginDto)? loginPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isValid)? isFormValid,
    TResult Function(LoginDto loginDto)? loginPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsFormValidEvent value) isFormValid,
    required TResult Function(_LoginPressedEvent value) loginPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsFormValidEvent value)? isFormValid,
    TResult? Function(_LoginPressedEvent value)? loginPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsFormValidEvent value)? isFormValid,
    TResult Function(_LoginPressedEvent value)? loginPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IsFormValidEventImplCopyWith<$Res> {
  factory _$$IsFormValidEventImplCopyWith(_$IsFormValidEventImpl value,
          $Res Function(_$IsFormValidEventImpl) then) =
      __$$IsFormValidEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isValid});
}

/// @nodoc
class __$$IsFormValidEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$IsFormValidEventImpl>
    implements _$$IsFormValidEventImplCopyWith<$Res> {
  __$$IsFormValidEventImplCopyWithImpl(_$IsFormValidEventImpl _value,
      $Res Function(_$IsFormValidEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
  }) {
    return _then(_$IsFormValidEventImpl(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsFormValidEventImpl implements _IsFormValidEvent {
  _$IsFormValidEventImpl({required this.isValid});

  @override
  final bool isValid;

  @override
  String toString() {
    return 'LoginEvent.isFormValid(isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsFormValidEventImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isValid);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsFormValidEventImplCopyWith<_$IsFormValidEventImpl> get copyWith =>
      __$$IsFormValidEventImplCopyWithImpl<_$IsFormValidEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isValid) isFormValid,
    required TResult Function(LoginDto loginDto) loginPressed,
  }) {
    return isFormValid(isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isValid)? isFormValid,
    TResult? Function(LoginDto loginDto)? loginPressed,
  }) {
    return isFormValid?.call(isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isValid)? isFormValid,
    TResult Function(LoginDto loginDto)? loginPressed,
    required TResult orElse(),
  }) {
    if (isFormValid != null) {
      return isFormValid(isValid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsFormValidEvent value) isFormValid,
    required TResult Function(_LoginPressedEvent value) loginPressed,
  }) {
    return isFormValid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsFormValidEvent value)? isFormValid,
    TResult? Function(_LoginPressedEvent value)? loginPressed,
  }) {
    return isFormValid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsFormValidEvent value)? isFormValid,
    TResult Function(_LoginPressedEvent value)? loginPressed,
    required TResult orElse(),
  }) {
    if (isFormValid != null) {
      return isFormValid(this);
    }
    return orElse();
  }
}

abstract class _IsFormValidEvent implements LoginEvent {
  factory _IsFormValidEvent({required final bool isValid}) =
      _$IsFormValidEventImpl;

  bool get isValid;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsFormValidEventImplCopyWith<_$IsFormValidEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginPressedEventImplCopyWith<$Res> {
  factory _$$LoginPressedEventImplCopyWith(_$LoginPressedEventImpl value,
          $Res Function(_$LoginPressedEventImpl) then) =
      __$$LoginPressedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginDto loginDto});
}

/// @nodoc
class __$$LoginPressedEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginPressedEventImpl>
    implements _$$LoginPressedEventImplCopyWith<$Res> {
  __$$LoginPressedEventImplCopyWithImpl(_$LoginPressedEventImpl _value,
      $Res Function(_$LoginPressedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginDto = null,
  }) {
    return _then(_$LoginPressedEventImpl(
      loginDto: null == loginDto
          ? _value.loginDto
          : loginDto // ignore: cast_nullable_to_non_nullable
              as LoginDto,
    ));
  }
}

/// @nodoc

class _$LoginPressedEventImpl implements _LoginPressedEvent {
  _$LoginPressedEventImpl({required this.loginDto});

  @override
  final LoginDto loginDto;

  @override
  String toString() {
    return 'LoginEvent.loginPressed(loginDto: $loginDto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPressedEventImpl &&
            (identical(other.loginDto, loginDto) ||
                other.loginDto == loginDto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginDto);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginPressedEventImplCopyWith<_$LoginPressedEventImpl> get copyWith =>
      __$$LoginPressedEventImplCopyWithImpl<_$LoginPressedEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isValid) isFormValid,
    required TResult Function(LoginDto loginDto) loginPressed,
  }) {
    return loginPressed(loginDto);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isValid)? isFormValid,
    TResult? Function(LoginDto loginDto)? loginPressed,
  }) {
    return loginPressed?.call(loginDto);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isValid)? isFormValid,
    TResult Function(LoginDto loginDto)? loginPressed,
    required TResult orElse(),
  }) {
    if (loginPressed != null) {
      return loginPressed(loginDto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsFormValidEvent value) isFormValid,
    required TResult Function(_LoginPressedEvent value) loginPressed,
  }) {
    return loginPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsFormValidEvent value)? isFormValid,
    TResult? Function(_LoginPressedEvent value)? loginPressed,
  }) {
    return loginPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsFormValidEvent value)? isFormValid,
    TResult Function(_LoginPressedEvent value)? loginPressed,
    required TResult orElse(),
  }) {
    if (loginPressed != null) {
      return loginPressed(this);
    }
    return orElse();
  }
}

abstract class _LoginPressedEvent implements LoginEvent {
  factory _LoginPressedEvent({required final LoginDto loginDto}) =
      _$LoginPressedEventImpl;

  LoginDto get loginDto;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginPressedEventImplCopyWith<_$LoginPressedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({bool isLoading, bool isFormValid, String? errorMessage});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFormValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isFormValid, String? errorMessage});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFormValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$LoginStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  _$LoginStateImpl(
      {this.isLoading = false, this.isFormValid = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isFormValid;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, isFormValid: $isFormValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isFormValid, errorMessage);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final bool isLoading,
      final bool isFormValid,
      final String? errorMessage}) = _$LoginStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isFormValid;
  @override
  String? get errorMessage;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
