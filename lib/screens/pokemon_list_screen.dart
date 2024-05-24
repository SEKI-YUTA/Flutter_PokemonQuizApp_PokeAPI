// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/components/pokemon_card.dart';
import 'package:pokemon_quiz_app/components/shimmer_pokemon_card.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/main.dart';
import 'package:pokemon_quiz_app/screens/pokemon_detail_screen.dart';

class PokemonListScreen extends ConsumerStatefulWidget {
  const PokemonListScreen({super.key});

  @override
  ConsumerState<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends ConsumerState<PokemonListScreen> {
  bool _shouldShowMoreLoadingUI = false;
  late ScrollController scrollController;

  @override
  void initState() {
    // _getPokemonData(null);
    scrollController = ScrollController();
    scrollController.addListener(() async {
      var isFetching =
          ref.read(pokemonDictionaryListProvider.notifier).isFetching;
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.95 &&
          ref.read(pokemonDictionaryListProvider.notifier).checkMoreData() &&
          !isFetching) {
        setState(() {
          _shouldShowMoreLoadingUI = true;
        });
        await ref.read(pokemonDictionaryListProvider.notifier).fetchMore();
        setState(() {
          _shouldShowMoreLoadingUI = false;
        });
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
            Flexible(
                child: pokemonList.when(
              data: (data) => DataContent(data),
              error: (error, stackTrace) => const Text('Error'),
              loading: () => LoadingContent(),
            ))
          ],
        ));
  }

  Widget LoadingContent() {
    return ListView.builder(itemBuilder: (context, index) {
      return const ShimmerPokemonCard();
    });
  }

  Widget DataContent(List<PokemonData?> pokemonList) {
    return ListView.builder(
        controller: scrollController,
        itemCount: pokemonList.length + 1,
        itemBuilder: (context, index) {
          if (index == pokemonList.length) {
            return _shouldShowMoreLoadingUI
                ? const SizedBox(
                    width: double.infinity,
                    child: Center(child: CircularProgressIndicator()))
                : Container();
          }
          var pokemonData = pokemonList[index];
          return pokemonData != null
              ? PokemonCard(
                  item: pokemonData,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailScreen(pokemonData: pokemonData)));
                  },
                )
              : const SizedBox();
        });
  }
}
