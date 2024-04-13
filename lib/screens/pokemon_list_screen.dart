import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_quiz_app/components/pokemon_card.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/model/PokemonListItem.dart';
import 'package:pokemon_quiz_app/other/PokeApiEndpoints.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<PokemonListItem?> pokemonList = [];
  String? nextURL;
  bool _isLoading = false;
  late ScrollController scrollController;

  Future<void> _fetchPokemonList(bool? appendMode) async {
    appendMode ??= false;
    setState(() {
      _isLoading = true;
    });
    final String fetchURL = nextURL != null
        ? nextURL!
        : "${PokeApiEndpoints.BASE_URL}/${PokeApiEndpoints.POKEMON}";
    var response = await http.get(Uri.parse(fetchURL));
    var decoded = jsonDecode(response.body);
    List<Future<void>> futureList = [];
    List<PokemonListItem?> list =
        List.generate(decoded['results'].length, (item) => null);
    for (int i = 0; i < decoded['results'].length; i++) {
      var item = decoded['results'][i];
      var f = _fetchPokemonDetail(item['url']).then((value) {
        list[i] = value;
      });
      futureList.add(f);
    }
    await Future.wait(futureList);
    setState(() {
      nextURL = decoded['next'];
      pokemonList = appendMode! ? [...pokemonList, ...list] : list;
      _isLoading = false;
    });
  }

  Future<PokemonListItem> _fetchPokemonDetail(String detailURL) async {
    var detailResponse = await http.get(Uri.parse(detailURL));
    var detailDecoded = jsonDecode(detailResponse.body);
    var speciesResponse =
        await http.get(Uri.parse(detailDecoded['species']['url']));
    var speciesDecoded = jsonDecode(speciesResponse.body);
    var data = PokemonListItem(
      pokemonName: speciesDecoded['names']
          .where((item) => item['language']['name'] == 'ja-Hrkt')
          .first['name'],
      pokemonImageURL: detailDecoded['sprites']['other']['official-artwork']
          ['front_default'],
    );
    return data;
  }

  @override
  void initState() {
    _fetchPokemonList(null);
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.95 &&
          !_isLoading) {
        if (nextURL != null) {
          _fetchPokemonList(true);
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
