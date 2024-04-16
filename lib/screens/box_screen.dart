import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/components/pokemon_card.dart';
import 'package:pokemon_quiz_app/data/FireStoreClient.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/CaughtPokemon.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/other/PokeApiEndpoints.dart';
import 'package:pokemon_quiz_app/screens/pokemon_detail_screen.dart';

class BoxScreen extends StatefulWidget {
  const BoxScreen({super.key});

  @override
  State<BoxScreen> createState() => _BoxScreenState();
}

class _BoxScreenState extends State<BoxScreen> {
  final List<PokemonData> _pokemonList = [];
  int _fetchedIndex = 0;
  final int _FETCH_COUNT = 10;
  bool _isLoading = false;
  bool _isFullLoaded = false;
  late ScrollController scrollController;

  Future<void> _getCaughtPokemonData() async {
    setState(() {
      _isLoading = true;
    });
    var caughtPokemonList = await FireStoreClient.getCaughtPokemonList();
    var addPokemonList = <PokemonData>[];
    var futureList = <Future>[];
    for (int i = _fetchedIndex; i < (_fetchedIndex + _FETCH_COUNT); i++) {
      if (i >= caughtPokemonList.length) {
        setState(() {
          _isFullLoaded = true;
        });
        break;
      }
      var f = PokeApi.fetchPokemonDetail(
              PokeApiEndpoints.createPokemonDetailURL(
                  caughtPokemonList[i].id.toString()))
          .then((pokemon) => addPokemonList.add(pokemon));
      futureList.add(f);
    }
    await Future.wait(futureList);
    if (mounted) {
      setState(() {
        _fetchedIndex += _FETCH_COUNT;
        _pokemonList.addAll(addPokemonList);
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.95 &&
          !_isLoading) {
        if (_isFullLoaded == false) {
          _getCaughtPokemonData();
        }
      }
    });
    _getCaughtPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _isLoading && _pokemonList.isEmpty
            ? const CenterMessage(
                message: "読み込み中...",
                showingLoadingIndicatoro: true,
              )
            : Column(
                children: [
                  Text(
                    "捕まえたポケモン",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Flexible(
                    child: ListView.builder(
                        itemCount: _pokemonList.length,
                        itemBuilder: (context, index) {
                          var pokemonData = _pokemonList[index];
                          return PokemonCard(
                            item: pokemonData,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PokemonDetailScreen(
                                      pokemonItem: pokemonData)));
                            },
                          );
                        }),
                  ),
                ],
              ));
  }
}
