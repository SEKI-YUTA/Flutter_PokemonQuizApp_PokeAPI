import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/pokemon_card.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/screens/pokemon_detail_screen.dart';

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
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    var (pokemonList, nextUrl) = await PokeApi.fetchPokemonList(nextURL);
    if (mounted) {
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
