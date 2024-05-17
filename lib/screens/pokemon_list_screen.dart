// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/components/pokemon_card.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/main.dart';
import 'package:pokemon_quiz_app/screens/pokemon_detail_screen.dart';

class PokemonListScreen extends ConsumerStatefulWidget {
  const PokemonListScreen({super.key});

  @override
  ConsumerState<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends ConsumerState<PokemonListScreen> {
  int _nextOffset = 0;
  final int _FETCH_SIZE = 20;
  bool _isLoading = false;
  late ScrollController scrollController;

  Future<void> _getPokemonData(bool? appendMode) async {
    if (ref.read(pokemonDictionaryListProvider).length >
        _nextOffset + _FETCH_SIZE) {
      if (mounted) {
        setState(() {
          _nextOffset = ref.read(pokemonDictionaryListProvider).length;
        });
      }
      return;
    }
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    var pokemonList =
        await PokeApi.fetchPokemonListWithOffsetIndex(_nextOffset, _FETCH_SIZE);
    if (mounted) {
      if (appendMode == true) {
        ref.read(pokemonDictionaryListProvider.notifier).addAll(pokemonList);
      } else {
        ref.read(pokemonDictionaryListProvider.notifier).setValue(pokemonList);
      }
      setState(() {
        _nextOffset += _FETCH_SIZE;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _getPokemonData(null);
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.95 &&
          !_isLoading) {
        _getPokemonData(true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pokemonList = ref.watch(pokemonDictionaryListProvider);
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            _isLoading && pokemonList.isEmpty
                ? const CenterMessage(
                    message: "読み込み中...",
                    showingLoadingIndicatoro: true,
                  )
                : Flexible(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: pokemonList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == pokemonList.length) {
                            return _isLoading
                                ? const SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                        child: CircularProgressIndicator()))
                                : Container();
                          }
                          var pokemonData = pokemonList[index];
                          return pokemonData != null
                              ? PokemonCard(
                                  item: pokemonData,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PokemonDetailScreen(
                                                    pokemonData: pokemonData)));
                                  },
                                )
                              : const SizedBox();
                        }),
                  )
          ],
        ));
  }
}
