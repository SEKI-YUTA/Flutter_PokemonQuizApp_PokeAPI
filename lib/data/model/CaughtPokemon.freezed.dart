// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CaughtPokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaughtPokemon _$CaughtPokemonFromJson(Map<String, dynamic> json) {
  return _CaughtPokemon.fromJson(json);
}

/// @nodoc
mixin _$CaughtPokemon {
  int get id => throw _privateConstructorUsedError;
  int get caughtAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaughtPokemonCopyWith<CaughtPokemon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaughtPokemonCopyWith<$Res> {
  factory $CaughtPokemonCopyWith(
          CaughtPokemon value, $Res Function(CaughtPokemon) then) =
      _$CaughtPokemonCopyWithImpl<$Res, CaughtPokemon>;
  @useResult
  $Res call({int id, int caughtAt});
}

/// @nodoc
class _$CaughtPokemonCopyWithImpl<$Res, $Val extends CaughtPokemon>
    implements $CaughtPokemonCopyWith<$Res> {
  _$CaughtPokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caughtAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      caughtAt: null == caughtAt
          ? _value.caughtAt
          : caughtAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaughtPokemonImplCopyWith<$Res>
    implements $CaughtPokemonCopyWith<$Res> {
  factory _$$CaughtPokemonImplCopyWith(
          _$CaughtPokemonImpl value, $Res Function(_$CaughtPokemonImpl) then) =
      __$$CaughtPokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int caughtAt});
}

/// @nodoc
class __$$CaughtPokemonImplCopyWithImpl<$Res>
    extends _$CaughtPokemonCopyWithImpl<$Res, _$CaughtPokemonImpl>
    implements _$$CaughtPokemonImplCopyWith<$Res> {
  __$$CaughtPokemonImplCopyWithImpl(
      _$CaughtPokemonImpl _value, $Res Function(_$CaughtPokemonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caughtAt = null,
  }) {
    return _then(_$CaughtPokemonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      caughtAt: null == caughtAt
          ? _value.caughtAt
          : caughtAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaughtPokemonImpl
    with DiagnosticableTreeMixin
    implements _CaughtPokemon {
  const _$CaughtPokemonImpl({required this.id, required this.caughtAt});

  factory _$CaughtPokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaughtPokemonImplFromJson(json);

  @override
  final int id;
  @override
  final int caughtAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CaughtPokemon(id: $id, caughtAt: $caughtAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CaughtPokemon'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('caughtAt', caughtAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaughtPokemonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caughtAt, caughtAt) ||
                other.caughtAt == caughtAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, caughtAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaughtPokemonImplCopyWith<_$CaughtPokemonImpl> get copyWith =>
      __$$CaughtPokemonImplCopyWithImpl<_$CaughtPokemonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaughtPokemonImplToJson(
      this,
    );
  }
}

abstract class _CaughtPokemon implements CaughtPokemon {
  const factory _CaughtPokemon(
      {required final int id,
      required final int caughtAt}) = _$CaughtPokemonImpl;

  factory _CaughtPokemon.fromJson(Map<String, dynamic> json) =
      _$CaughtPokemonImpl.fromJson;

  @override
  int get id;
  @override
  int get caughtAt;
  @override
  @JsonKey(ignore: true)
  _$$CaughtPokemonImplCopyWith<_$CaughtPokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
