import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

part 'BoxScreenState.freezed.dart';
part 'BoxScreenState.g.dart';

@freezed
class BoxScreenState with _$BoxScreenState {
  const factory BoxScreenState({
    List<PokemonData?>? caughtPokemonList,
    @Default(false) bool shouldShowMoreLoadingUI
  }) = _BoxScreenState;

  factory BoxScreenState.fromJson(Map<String, Object?> json) =>
      _$BoxScreenStateFromJson(json);
}
