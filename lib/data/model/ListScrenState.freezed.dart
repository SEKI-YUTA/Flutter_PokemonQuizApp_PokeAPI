// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ListScrenState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListScreenState _$ListScreenStateFromJson(Map<String, dynamic> json) {
  return _ListScreenState.fromJson(json);
}

/// @nodoc
mixin _$ListScreenState {
  List<PokemonData?>? get pokemonList => throw _privateConstructorUsedError;
  bool get shouldShowMoreLoadingUI => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListScreenStateCopyWith<ListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListScreenStateCopyWith<$Res> {
  factory $ListScreenStateCopyWith(
          ListScreenState value, $Res Function(ListScreenState) then) =
      _$ListScreenStateCopyWithImpl<$Res, ListScreenState>;
  @useResult
  $Res call({List<PokemonData?>? pokemonList, bool shouldShowMoreLoadingUI});
}

/// @nodoc
class _$ListScreenStateCopyWithImpl<$Res, $Val extends ListScreenState>
    implements $ListScreenStateCopyWith<$Res> {
  _$ListScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonList = freezed,
    Object? shouldShowMoreLoadingUI = null,
  }) {
    return _then(_value.copyWith(
      pokemonList: freezed == pokemonList
          ? _value.pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<PokemonData?>?,
      shouldShowMoreLoadingUI: null == shouldShowMoreLoadingUI
          ? _value.shouldShowMoreLoadingUI
          : shouldShowMoreLoadingUI // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListScreenStateImplCopyWith<$Res>
    implements $ListScreenStateCopyWith<$Res> {
  factory _$$ListScreenStateImplCopyWith(_$ListScreenStateImpl value,
          $Res Function(_$ListScreenStateImpl) then) =
      __$$ListScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PokemonData?>? pokemonList, bool shouldShowMoreLoadingUI});
}

/// @nodoc
class __$$ListScreenStateImplCopyWithImpl<$Res>
    extends _$ListScreenStateCopyWithImpl<$Res, _$ListScreenStateImpl>
    implements _$$ListScreenStateImplCopyWith<$Res> {
  __$$ListScreenStateImplCopyWithImpl(
      _$ListScreenStateImpl _value, $Res Function(_$ListScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonList = freezed,
    Object? shouldShowMoreLoadingUI = null,
  }) {
    return _then(_$ListScreenStateImpl(
      pokemonList: freezed == pokemonList
          ? _value._pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
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
class _$ListScreenStateImpl
    with DiagnosticableTreeMixin
    implements _ListScreenState {
  const _$ListScreenStateImpl(
      {final List<PokemonData?>? pokemonList,
      this.shouldShowMoreLoadingUI = false})
      : _pokemonList = pokemonList;

  factory _$ListScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListScreenStateImplFromJson(json);

  final List<PokemonData?>? _pokemonList;
  @override
  List<PokemonData?>? get pokemonList {
    final value = _pokemonList;
    if (value == null) return null;
    if (_pokemonList is EqualUnmodifiableListView) return _pokemonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool shouldShowMoreLoadingUI;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListScreenState(pokemonList: $pokemonList, shouldShowMoreLoadingUI: $shouldShowMoreLoadingUI)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListScreenState'))
      ..add(DiagnosticsProperty('pokemonList', pokemonList))
      ..add(DiagnosticsProperty(
          'shouldShowMoreLoadingUI', shouldShowMoreLoadingUI));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._pokemonList, _pokemonList) &&
            (identical(
                    other.shouldShowMoreLoadingUI, shouldShowMoreLoadingUI) ||
                other.shouldShowMoreLoadingUI == shouldShowMoreLoadingUI));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pokemonList),
      shouldShowMoreLoadingUI);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListScreenStateImplCopyWith<_$ListScreenStateImpl> get copyWith =>
      __$$ListScreenStateImplCopyWithImpl<_$ListScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListScreenStateImplToJson(
      this,
    );
  }
}

abstract class _ListScreenState implements ListScreenState {
  const factory _ListScreenState(
      {final List<PokemonData?>? pokemonList,
      final bool shouldShowMoreLoadingUI}) = _$ListScreenStateImpl;

  factory _ListScreenState.fromJson(Map<String, dynamic> json) =
      _$ListScreenStateImpl.fromJson;

  @override
  List<PokemonData?>? get pokemonList;
  @override
  bool get shouldShowMoreLoadingUI;
  @override
  @JsonKey(ignore: true)
  _$$ListScreenStateImplCopyWith<_$ListScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
