// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'QuizData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizData _$QuizDataFromJson(Map<String, dynamic> json) {
  return _QuizData.fromJson(json);
}

/// @nodoc
mixin _$QuizData {
  QuizStatus get status => throw _privateConstructorUsedError;
  PokemonData get pokemonData => throw _privateConstructorUsedError;
  int get hintStep => throw _privateConstructorUsedError;
  String get userAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizDataCopyWith<QuizData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDataCopyWith<$Res> {
  factory $QuizDataCopyWith(QuizData value, $Res Function(QuizData) then) =
      _$QuizDataCopyWithImpl<$Res, QuizData>;
  @useResult
  $Res call(
      {QuizStatus status,
      PokemonData pokemonData,
      int hintStep,
      String userAnswer});

  $PokemonDataCopyWith<$Res> get pokemonData;
}

/// @nodoc
class _$QuizDataCopyWithImpl<$Res, $Val extends QuizData>
    implements $QuizDataCopyWith<$Res> {
  _$QuizDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pokemonData = null,
    Object? hintStep = null,
    Object? userAnswer = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QuizStatus,
      pokemonData: null == pokemonData
          ? _value.pokemonData
          : pokemonData // ignore: cast_nullable_to_non_nullable
              as PokemonData,
      hintStep: null == hintStep
          ? _value.hintStep
          : hintStep // ignore: cast_nullable_to_non_nullable
              as int,
      userAnswer: null == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PokemonDataCopyWith<$Res> get pokemonData {
    return $PokemonDataCopyWith<$Res>(_value.pokemonData, (value) {
      return _then(_value.copyWith(pokemonData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizDataImplCopyWith<$Res>
    implements $QuizDataCopyWith<$Res> {
  factory _$$QuizDataImplCopyWith(
          _$QuizDataImpl value, $Res Function(_$QuizDataImpl) then) =
      __$$QuizDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QuizStatus status,
      PokemonData pokemonData,
      int hintStep,
      String userAnswer});

  @override
  $PokemonDataCopyWith<$Res> get pokemonData;
}

/// @nodoc
class __$$QuizDataImplCopyWithImpl<$Res>
    extends _$QuizDataCopyWithImpl<$Res, _$QuizDataImpl>
    implements _$$QuizDataImplCopyWith<$Res> {
  __$$QuizDataImplCopyWithImpl(
      _$QuizDataImpl _value, $Res Function(_$QuizDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pokemonData = null,
    Object? hintStep = null,
    Object? userAnswer = null,
  }) {
    return _then(_$QuizDataImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QuizStatus,
      pokemonData: null == pokemonData
          ? _value.pokemonData
          : pokemonData // ignore: cast_nullable_to_non_nullable
              as PokemonData,
      hintStep: null == hintStep
          ? _value.hintStep
          : hintStep // ignore: cast_nullable_to_non_nullable
              as int,
      userAnswer: null == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizDataImpl with DiagnosticableTreeMixin implements _QuizData {
  const _$QuizDataImpl(
      {this.status = QuizStatus.NOT_ANSWERED,
      required this.pokemonData,
      required this.hintStep,
      required this.userAnswer});

  factory _$QuizDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizDataImplFromJson(json);

  @override
  @JsonKey()
  final QuizStatus status;
  @override
  final PokemonData pokemonData;
  @override
  final int hintStep;
  @override
  final String userAnswer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizData(status: $status, pokemonData: $pokemonData, hintStep: $hintStep, userAnswer: $userAnswer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizData'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('pokemonData', pokemonData))
      ..add(DiagnosticsProperty('hintStep', hintStep))
      ..add(DiagnosticsProperty('userAnswer', userAnswer));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizDataImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pokemonData, pokemonData) ||
                other.pokemonData == pokemonData) &&
            (identical(other.hintStep, hintStep) ||
                other.hintStep == hintStep) &&
            (identical(other.userAnswer, userAnswer) ||
                other.userAnswer == userAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, pokemonData, hintStep, userAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizDataImplCopyWith<_$QuizDataImpl> get copyWith =>
      __$$QuizDataImplCopyWithImpl<_$QuizDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizDataImplToJson(
      this,
    );
  }
}

abstract class _QuizData implements QuizData {
  const factory _QuizData(
      {final QuizStatus status,
      required final PokemonData pokemonData,
      required final int hintStep,
      required final String userAnswer}) = _$QuizDataImpl;

  factory _QuizData.fromJson(Map<String, dynamic> json) =
      _$QuizDataImpl.fromJson;

  @override
  QuizStatus get status;
  @override
  PokemonData get pokemonData;
  @override
  int get hintStep;
  @override
  String get userAnswer;
  @override
  @JsonKey(ignore: true)
  _$$QuizDataImplCopyWith<_$QuizDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
