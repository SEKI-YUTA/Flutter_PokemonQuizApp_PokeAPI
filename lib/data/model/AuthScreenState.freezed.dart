// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AuthScreenState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthScreenState _$AuthScreenStateFromJson(Map<String, dynamic> json) {
  return _AuthScreenState.fromJson(json);
}

/// @nodoc
mixin _$AuthScreenState {
  bool get isLoginMode => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthScreenStateCopyWith<AuthScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthScreenStateCopyWith<$Res> {
  factory $AuthScreenStateCopyWith(
          AuthScreenState value, $Res Function(AuthScreenState) then) =
      _$AuthScreenStateCopyWithImpl<$Res, AuthScreenState>;
  @useResult
  $Res call(
      {bool isLoginMode,
      bool isLoading,
      String email,
      String password,
      String errorMessage,
      bool isPasswordVisible});
}

/// @nodoc
class _$AuthScreenStateCopyWithImpl<$Res, $Val extends AuthScreenState>
    implements $AuthScreenStateCopyWith<$Res> {
  _$AuthScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoginMode = null,
    Object? isLoading = null,
    Object? email = null,
    Object? password = null,
    Object? errorMessage = null,
    Object? isPasswordVisible = null,
  }) {
    return _then(_value.copyWith(
      isLoginMode: null == isLoginMode
          ? _value.isLoginMode
          : isLoginMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthScreenStateImplCopyWith<$Res>
    implements $AuthScreenStateCopyWith<$Res> {
  factory _$$AuthScreenStateImplCopyWith(_$AuthScreenStateImpl value,
          $Res Function(_$AuthScreenStateImpl) then) =
      __$$AuthScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoginMode,
      bool isLoading,
      String email,
      String password,
      String errorMessage,
      bool isPasswordVisible});
}

/// @nodoc
class __$$AuthScreenStateImplCopyWithImpl<$Res>
    extends _$AuthScreenStateCopyWithImpl<$Res, _$AuthScreenStateImpl>
    implements _$$AuthScreenStateImplCopyWith<$Res> {
  __$$AuthScreenStateImplCopyWithImpl(
      _$AuthScreenStateImpl _value, $Res Function(_$AuthScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoginMode = null,
    Object? isLoading = null,
    Object? email = null,
    Object? password = null,
    Object? errorMessage = null,
    Object? isPasswordVisible = null,
  }) {
    return _then(_$AuthScreenStateImpl(
      isLoginMode: null == isLoginMode
          ? _value.isLoginMode
          : isLoginMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthScreenStateImpl
    with DiagnosticableTreeMixin
    implements _AuthScreenState {
  const _$AuthScreenStateImpl(
      {this.isLoginMode = true,
      this.isLoading = false,
      this.email = "",
      this.password = "",
      this.errorMessage = "",
      this.isPasswordVisible = false});

  factory _$AuthScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthScreenStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoginMode;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool isPasswordVisible;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthScreenState(isLoginMode: $isLoginMode, isLoading: $isLoading, email: $email, password: $password, errorMessage: $errorMessage, isPasswordVisible: $isPasswordVisible)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthScreenState'))
      ..add(DiagnosticsProperty('isLoginMode', isLoginMode))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('isPasswordVisible', isPasswordVisible));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthScreenStateImpl &&
            (identical(other.isLoginMode, isLoginMode) ||
                other.isLoginMode == isLoginMode) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoginMode, isLoading, email,
      password, errorMessage, isPasswordVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthScreenStateImplCopyWith<_$AuthScreenStateImpl> get copyWith =>
      __$$AuthScreenStateImplCopyWithImpl<_$AuthScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthScreenStateImplToJson(
      this,
    );
  }
}

abstract class _AuthScreenState implements AuthScreenState {
  const factory _AuthScreenState(
      {final bool isLoginMode,
      final bool isLoading,
      final String email,
      final String password,
      final String errorMessage,
      final bool isPasswordVisible}) = _$AuthScreenStateImpl;

  factory _AuthScreenState.fromJson(Map<String, dynamic> json) =
      _$AuthScreenStateImpl.fromJson;

  @override
  bool get isLoginMode;
  @override
  bool get isLoading;
  @override
  String get email;
  @override
  String get password;
  @override
  String get errorMessage;
  @override
  bool get isPasswordVisible;
  @override
  @JsonKey(ignore: true)
  _$$AuthScreenStateImplCopyWith<_$AuthScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
