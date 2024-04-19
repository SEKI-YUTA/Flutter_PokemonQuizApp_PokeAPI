import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:riverpod/riverpod.dart';

class PokemonDictionaryList extends Notifier<List<PokemonData?>> {
  // final _LIMIT = 200;
  @override
  List<PokemonData?> build() => [];

  void setValue(List<PokemonData?> pokemonDataList) {
    state = pokemonDataList;
  }

  void add(PokemonData? pokemonData) {
    // メモリの使いすぎを防ぐために保管する数に制限をかける処理をしたいが複雑になるので今回はしない
    // if (state.length >= _LIMIT) {
    //   state = [...state.sublist(1), pokemonData];
    // } else {
    //   state = [...state, pokemonData];
    // }
    state = [...state, pokemonData];
  }

  void addAll(List<PokemonData?> pokemonDataList) {
    // メモリの使いすぎを防ぐために保管する数に制限をかける処理をしたいが複雑になるので今回はしない
    // var willSize = state.length + pokemonDataList.length;
    // if (willSize > _LIMIT) {
    //   state = [
    //     ...state.sublist(willSize - _LIMIT),
    //     ...pokemonDataList.sublist(0, _LIMIT - state.length)
    //   ];
    // } else {
    //   state = [...state, ...pokemonDataList];
    // }
    state = [...state, ...pokemonDataList];
  }
}
