// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BoxScreenState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoxScreenState _$BoxScreenStateFromJson(Map<String, dynamic> json) {
  return _BoxScreenState.fromJson(json);
}

/// @nodoc
mixin _$BoxScreenState {
  List<PokemonData?>? get caughtPokemonList =>
      throw _privateConstructorUsedError;
  bool get shouldShowMoreLoadingUI => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoxScreenStateCopyWith<BoxScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoxScreenStateCopyWith<$Res> {
  factory $BoxScreenStateCopyWith(
          BoxScreenState value, $Res Function(BoxScreenState) then) =
      _$BoxScreenStateCopyWithImpl<$Res, BoxScreenState>;
  @useResult
  $Res call(
      {List<PokemonData?>? caughtPokemonList, bool shouldShowMoreLoadingUI});
}

/// @nodoc
class _$BoxScreenStateCopyWithImpl<$Res, $Val extends BoxScreenState>
    implements $BoxScreenStateCopyWith<$Res> {
  _$BoxScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caughtPokemonList = freezed,
    Object? shouldShowMoreLoadingUI = null,
  }) {
    return _then(_value.copyWith(
      caughtPokemonList: freezed == caughtPokemonList
          ? _value.caughtPokemonList
          : caughtPokemonList // ignore: cast_nullable_to_non_nullable
              as List<PokemonData?>?,
      shouldShowMoreLoadingUI: null == shouldShowMoreLoadingUI
          ? _value.shouldShowMoreLoadingUI
          : shouldShowMoreLoadingUI // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoxScreenStateImplCopyWith<$Res>
    implements $BoxScreenStateCopyWith<$Res> {
  factory _$$BoxScreenStateImplCopyWith(_$BoxScreenStateImpl value,
          $Res Function(_$BoxScreenStateImpl) then) =
      __$$BoxScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PokemonData?>? caughtPokemonList, bool shouldShowMoreLoadingUI});
}

/// @nodoc
class __$$BoxScreenStateImplCopyWithImpl<$Res>
    extends _$BoxScreenStateCopyWithImpl<$Res, _$BoxScreenStateImpl>
    implements _$$BoxScreenStateImplCopyWith<$Res> {
  __$$BoxScreenStateImplCopyWithImpl(
      _$BoxScreenStateImpl _value, $Res Function(_$BoxScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caughtPokemonList = freezed,
    Object? shouldShowMoreLoadingUI = null,
  }) {
    return _then(_$BoxScreenStateImpl(
      caughtPokemonList: freezed == caughtPokemonList
          ? _value._caughtPokemonList
          : caughtPokemonList // ignore: cast_nullable_to_non_nullable
              as List<PokemonData?>?,
      shouldShowMoreLoadingUI: null == shouldShowMoreLoadingUI
          ? _value.shouldShowMoreLoadingUI
          : shouldShowMoreLoadingUI // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoxScreenStateImpl
    with DiagnosticableTreeMixin
    implements _BoxScreenState {
  const _$BoxScreenStateImpl(
      {final List<PokemonData?>? caughtPokemonList,
      this.shouldShowMoreLoadingUI = false})
      : _caughtPokemonList = caughtPokemonList;

  factory _$BoxScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoxScreenStateImplFromJson(json);

  final List<PokemonData?>? _caughtPokemonList;
  @override
  List<PokemonData?>? get caughtPokemonList {
    final value = _caughtPokemonList;
    if (value == null) return null;
    if (_caughtPokemonList is EqualUnmodifiableListView)
      return _caughtPokemonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool shouldShowMoreLoadingUI;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BoxScreenState(caughtPokemonList: $caughtPokemonList, shouldShowMoreLoadingUI: $shouldShowMoreLoadingUI)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BoxScreenState'))
      ..add(DiagnosticsProperty('caughtPokemonList', caughtPokemonList))
      ..add(DiagnosticsProperty(
          'shouldShowMoreLoadingUI', shouldShowMoreLoadingUI));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoxScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._caughtPokemonList, _caughtPokemonList) &&
            (identical(
                    other.shouldShowMoreLoadingUI, shouldShowMoreLoadingUI) ||
                other.shouldShowMoreLoadingUI == shouldShowMoreLoadingUI));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_caughtPokemonList),
      shouldShowMoreLoadingUI);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoxScreenStateImplCopyWith<_$BoxScreenStateImpl> get copyWith =>
      __$$BoxScreenStateImplCopyWithImpl<_$BoxScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoxScreenStateImplToJson(
      this,
    );
  }
}

abstract class _BoxScreenState implements BoxScreenState {
  const factory _BoxScreenState(
      {final List<PokemonData?>? caughtPokemonList,
      final bool shouldShowMoreLoadingUI}) = _$BoxScreenStateImpl;

  factory _BoxScreenState.fromJson(Map<String, dynamic> json) =
      _$BoxScreenStateImpl.fromJson;

  @override
  List<PokemonData?>? get caughtPokemonList;
  @override
  bool get shouldShowMoreLoadingUI;
  @override
  @JsonKey(ignore: true)
  _$$BoxScreenStateImplCopyWith<_$BoxScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
