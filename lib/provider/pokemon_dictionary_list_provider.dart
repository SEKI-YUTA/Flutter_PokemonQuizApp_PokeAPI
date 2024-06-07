// ignore_for_file: non_constant_identifier_names, avoid_public_notifier_properties

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/ListScrenState.dart';

final pokemonDictionaryListProvider =
    AsyncNotifierProvider<PokemonDictionaryList, ListScreenState?>(
        PokemonDictionaryList.new);

class PokemonDictionaryList extends AsyncNotifier<ListScreenState?> {
  final _LIMIT = 1302;
  final _FETCH_SIZE = 20;
  bool isFetching = false;
  int _nextOffset = 0;

  @override
  Future<ListScreenState?> build() async {
    isFetching = true;
    var pokemonList =
        await PokeApi.fetchPokemonListWithOffsetIndex(_nextOffset, _FETCH_SIZE);
    _nextOffset += _FETCH_SIZE;
    isFetching = false;
    return ListScreenState(pokemonList: pokemonList);
  }

  Future<void> fetchMore() async {
    isFetching = true;
    try {
      state = AsyncValue.data(state.value?.copyWith(shouldShowMoreLoadingUI: true));
      var pokemonList = await PokeApi.fetchPokemonListWithOffsetIndex(
          _nextOffset, _FETCH_SIZE);
      _nextOffset += _FETCH_SIZE;
      state = AsyncValue.data(ListScreenState(
        pokemonList: [...state.value?.pokemonList ?? [], ...pokemonList],
        shouldShowMoreLoadingUI: false
      ));
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
