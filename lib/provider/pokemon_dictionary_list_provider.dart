import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

final pokemonDictionaryListProvider =
    AsyncNotifierProvider<PokemonDictionaryList, List<PokemonData?>>(
        PokemonDictionaryList.new);

class PokemonDictionaryList extends AsyncNotifier<List<PokemonData?>> {
  final _LIMIT = 1302;
  final _FETCH_SIZE = 20;
  bool isFetching = false;
  int _nextOffset = 0;

  @override
  Future<List<PokemonData?>> build() async {
    isFetching = true;
    var pokemonList =
        await PokeApi.fetchPokemonListWithOffsetIndex(_nextOffset, _FETCH_SIZE);
    _nextOffset += _FETCH_SIZE;
    isFetching = false;
    return pokemonList;
  }

  Future<void> fetchMore() async {
    isFetching = true;
    try {
      var pokemonList = await PokeApi.fetchPokemonListWithOffsetIndex(
          _nextOffset, _FETCH_SIZE);
      _nextOffset += _FETCH_SIZE;
      state = AsyncValue.data([...state.value!, ...pokemonList]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } finally {
      isFetching = false;
    }
  }

  bool checkMoreData() {
    return _LIMIT > _nextOffset;
  }

  bool isLoading() {
    return isFetching;
  }
}
