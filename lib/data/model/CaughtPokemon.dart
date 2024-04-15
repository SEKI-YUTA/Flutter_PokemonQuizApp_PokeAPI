import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'CaughtPokemon.freezed.dart';
part 'CaughtPokemon.g.dart';

@freezed
class CaughtPokemon with _$CaughtPokemon {
  const factory CaughtPokemon({
    required int id,
    required int caughtAt,
  }) = _CaughtPokemon;

  factory CaughtPokemon.fromJson(Map<String, Object?> json) =>
      _$CaughtPokemonFromJson(json);
}
