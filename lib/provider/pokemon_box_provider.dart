import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/provider/caught_pokemon_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final pokemonBoxProvider = AutoDisposeAsyncNotifierProvider<PokemonBox, List<PokemonData?>>(
    PokemonBox.new);

class PokemonBox extends AutoDisposeAsyncNotifier<List<PokemonData?>> {
  final _FETCH_SIZE = 20;
  bool isFetching = false;
  int _nextOffset = 0;

  @override
  Future<List<PokemonData?>> build() async {
    isFetching = true;
    var caughtPokemonList = await ref.read(getCaughtPokemonListProvider(FirebaseAuth.instance.currentUser!.uid).future);
    var pokemonList = await PokeApi.fetchCaughtPokemonListWithOffsetIndex(caughtPokemonList, _nextOffset, _FETCH_SIZE);
    print(pokemonList.length);
    _nextOffset += _FETCH_SIZE;
    isFetching = false;
    return pokemonList;
  }

  Future<void> fetchMore() async {
    isFetching = true;
    try {
      var caughtPokemonList = await ref.read(getCaughtPokemonListProvider(FirebaseAuth.instance.currentUser!.uid).future);
      var pokemonList = await PokeApi.fetchCaughtPokemonListWithOffsetIndex(caughtPokemonList, _nextOffset, _FETCH_SIZE);
      _nextOffset += _FETCH_SIZE;
      state = AsyncValue.data([...state.value!, ...pokemonList]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } finally {
      isFetching = false;
    }
  }

}