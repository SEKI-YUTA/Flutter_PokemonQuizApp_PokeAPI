import 'package:pokemon_quiz_app/data/FireStoreClient.dart';
import 'package:pokemon_quiz_app/data/model/CaughtPokemon.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'caught_pokemon_provider.g.dart';

@riverpod
Future<List<CaughtPokemon>> getCaughtPokemonList(GetCaughtPokemonListRef ref, String uid) async {
  return FireStoreClient.getCaughtPokemonList(uid);
}