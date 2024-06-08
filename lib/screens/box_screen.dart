// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/components/pokemon_card.dart';
import 'package:pokemon_quiz_app/components/shimmer_pokemon_card.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/provider/pokemon_box_provider.dart';
import 'package:pokemon_quiz_app/screens/pokemon_detail_screen.dart';

class BoxScreen extends ConsumerStatefulWidget {
  const BoxScreen({super.key});

  @override
  ConsumerState<BoxScreen> createState() => _BoxScreenState();
}

class _BoxScreenState extends ConsumerState<BoxScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() async {
      var isFetching = ref.read(pokemonBoxProvider.notifier).isFetching;
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.95 &&
          !isFetching) {
        await ref.read(pokemonBoxProvider.notifier).fetchMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var boxScreenState = ref.watch(pokemonBoxProvider);
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              "捕まえたポケモン",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Flexible(
              child: boxScreenState.when(
                data: (data) => DataContent(
                  data?.caughtPokemonList ?? [],
                  data?.shouldShowMoreLoadingUI ?? false,
                ),
                error: (error, stackTrace) => const Text('Error'),
                loading: () => LoadingContent(),
              ),
            ),
          ],
        ));
  }

  Widget DataContent(
    List<PokemonData?> caughtPokemonList,
    bool shouldShowMoreLoadingUI,
  ) {
    return caughtPokemonList.isEmpty
        ? const CenterMessage(
            message: "捕まえたポケモンがいません。\n ポケモンクイズに正解してポケモンを捕まえよう!",
            showingLoadingIndicatoro: false,
          )
        : Flexible(
            child: ListView.builder(
                controller: scrollController,
                itemCount: caughtPokemonList.length + 1,
                itemBuilder: (context, index) {
                  if (index == caughtPokemonList.length) {
                    return shouldShowMoreLoadingUI
                        ? const SizedBox(
                            width: double.infinity,
                            child: Center(child: CircularProgressIndicator()))
                        : Container();
                  }
                  var pokemonData = caughtPokemonList[index];
                  return pokemonData != null
                      ? PokemonCard(
                          item: pokemonData,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PokemonDetailScreen(
                                      pokemonData: pokemonData,
                                      shouldShowStatus: true,
                                    )));
                          },
                        )
                      : Container();
                }),
          );
  }

  Widget LoadingContent() {
    return ListView.builder(itemBuilder: (context, index) {
      return const ShimmerPokemonCard();
    });
  }
}
