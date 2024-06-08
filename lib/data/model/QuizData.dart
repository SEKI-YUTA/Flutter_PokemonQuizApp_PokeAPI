import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/data/model/QuizStatus.dart';

part 'QuizData.freezed.dart';
part 'QuizData.g.dart';


@freezed
class QuizData with _$QuizData {
  const factory QuizData({
    @Default(QuizStatus.NOT_ANSWERED) QuizStatus status,
    required PokemonData pokemonData,
    required int hintStep,
    required String userAnswer,
  }) = _QuizData;

  factory QuizData.fromJson(Map<String, Object?> json) =>
      _$QuizDataFromJson(json);
}