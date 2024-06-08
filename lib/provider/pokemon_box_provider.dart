// ignore_for_file: non_constant_identifier_names, avoid_public_notifier_properties

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/BoxScreenState.dart';
import 'package:pokemon_quiz_app/provider/caught_pokemon_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final pokemonBoxProvider =
    AutoDisposeAsyncNotifierProvider<PokemonBox, BoxScreenState?>(
        PokemonBox.new);

class PokemonBox extends AutoDisposeAsyncNotifier<BoxScreenState?> {
  final _FETCH_SIZE = 20;
  bool isFetching = false;
  int _nextOffset = 0;

  @override
  Future<BoxScreenState> build() async {
    isFetching = true;
    var caughtPokemonList = await ref.read(
        getCaughtPokemonListProvider(FirebaseAuth.instance.currentUser!.uid)
            .future);
    var pokemonList = await PokeApi.fetchCaughtPokemonListWithOffsetIndex(
        caughtPokemonList, _nextOffset, _FETCH_SIZE);
    _nextOffset += _FETCH_SIZE;
    isFetching = false;
    return BoxScreenState(caughtPokemonList: pokemonList);
  }

  Future<void> fetchMore() async {
    isFetching = true;
    try {
      state =
          AsyncValue.data(state.value?.copyWith(shouldShowMoreLoadingUI: true));
      var caughtPokemonList = await ref.read(
          getCaughtPokemonListProvider(FirebaseAuth.instance.currentUser!.uid)
              .future);
      var pokemonList = await PokeApi.fetchCaughtPokemonListWithOffsetIndex(
          caughtPokemonList, _nextOffset, _FETCH_SIZE);
      _nextOffset += _FETCH_SIZE;
      state = AsyncValue.data(state.value?.copyWith(
        caughtPokemonList: [
          ...state.value?.caughtPokemonList ?? [],
          ...pokemonList
        ],
        shouldShowMoreLoadingUI: false,
      ));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } finally {
      isFetching = false;
    }
  }
}
