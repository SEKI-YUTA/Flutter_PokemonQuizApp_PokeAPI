import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

part 'ListScrenState.freezed.dart';
part 'ListScrenState.g.dart';

@freezed
class ListScreenState with _$ListScreenState {
  const factory ListScreenState(
      {List<PokemonData?>? pokemonList,
      @Default(false) bool shouldShowMoreLoadingUI}) = _ListScreenState;

  factory ListScreenState.fromJson(Map<String, Object?> json) =>
      _$ListScreenStateFromJson(json);
}
