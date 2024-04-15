// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuizData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizDataImpl _$$QuizDataImplFromJson(Map<String, dynamic> json) =>
    _$QuizDataImpl(
      status: $enumDecodeNullable(_$QuizStatusEnumMap, json['status']) ??
          QuizStatus.NOT_ANSWERED,
      pokemonData:
          PokemonData.fromJson(json['pokemonData'] as Map<String, dynamic>),
      hintStep: json['hintStep'] as int,
    );

Map<String, dynamic> _$$QuizDataImplToJson(_$QuizDataImpl instance) =>
    <String, dynamic>{
      'status': _$QuizStatusEnumMap[instance.status]!,
      'pokemonData': instance.pokemonData,
      'hintStep': instance.hintStep,
    };

const _$QuizStatusEnumMap = {
  QuizStatus.NOT_ANSWERED: 'NOT_ANSWERED',
  QuizStatus.CORRECT: 'CORRECT',
  QuizStatus.INCORRECT: 'INCORRECT',
  QuizStatus.GIVE_UP: 'GIVE_UP',
};
