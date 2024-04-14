import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/pokemon_card.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<PokemonData?> pokemonList = [];
  String? nextURL;
  bool _isLoading = false;
  late ScrollController scrollController;

  Future<void> _getPokemonData(bool? appendMode) async {
    setState(() {
      _isLoading = true;
    });
    var (pokemonList, nextUrl) = await PokeApi.fetchPokemonList(nextURL);
    setState(() {
      if (appendMode == true) {
        this.pokemonList.addAll(pokemonList);
      } else {
        this.pokemonList = pokemonList;
      }
      nextURL = nextUrl;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _getPokemonData(null);
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.95 &&
          !_isLoading) {
        if (nextURL != null) {
          _getPokemonData(true);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _isLoading && pokemonList.isEmpty
            ? CenterMessage(
                message: "読み込み中...",
                showingLoadingIndicatoro: true,
              )
            : ListView.builder(
                controller: scrollController,
                itemCount: pokemonList.length + 1,
                itemBuilder: (context, index) {
                  if (index == pokemonList.length) {
                    return _isLoading
                        ? const SizedBox(
                            width: double.infinity,
                            child: Center(child: CircularProgressIndicator()))
                        : Container();
                  }
                  var pokemon = pokemonList[index];
                  return pokemon != null
                      ? PokemonCard(item: pokemon)
                      : const SizedBox();
                }));
  }
}
