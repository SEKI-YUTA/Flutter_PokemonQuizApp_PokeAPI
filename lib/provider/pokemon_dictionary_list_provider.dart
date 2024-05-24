import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/data/model/PokemonDictionaryList.dart';

final pokemonDictionaryListProvider =
    AsyncNotifierProvider<PokemonDictionaryList, List<PokemonData?>>(
        PokemonDictionaryList.new);