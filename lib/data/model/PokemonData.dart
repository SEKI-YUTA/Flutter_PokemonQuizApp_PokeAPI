import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'PokemonData.freezed.dart';
part 'PokemonData.g.dart';

@freezed
class PokemonData with _$PokemonData {
  const factory PokemonData({
    required int id,
    required String pokemonName,
    required String pokemonImageURL,
    required int hp,
    required int attack,
    required int specialAttack,
    required int defense,
    required int specialDefense,
    required int speed,
    required int weight,
    required int height,
    required List<dynamic> types,
  }) = _PokemonData;

  factory PokemonData.fromJson(Map<String, Object?> json) =>
      _$PokemonDataFromJson(json);
}
