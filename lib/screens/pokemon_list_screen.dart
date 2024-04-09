import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_quiz_app/components/PokemonCard.dart';
import 'package:pokemon_quiz_app/model/PokemonListItem.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final String _baseURL = 'https://pokeapi.co/api/v2/';
  final String _pokemonListEndPoint = 'pokemon';
  List<PokemonListItem> pokemonList = [];
  String? nextURL;
  bool _isLoading = false;
  late ScrollController scrollController;

  Future<void> _fetchPokemonList(bool? appendMode) async {
    appendMode ??= false;
    setState(() {
      _isLoading = true;
    });
    final String fetchURL =
        nextURL != null ? nextURL! : _baseURL + _pokemonListEndPoint;
    var response = await http.get(Uri.parse(fetchURL));
    var decoded = jsonDecode(response.body);
    List<PokemonListItem> fetchedList =
        List<PokemonListItem>.from(decoded['results'].map((item) {
      return PokemonListItem(name: item['name'], url: item['url']);
    }));
    setState(() {
      nextURL = decoded['next'];
      pokemonList =
          appendMode! ? [...pokemonList, ...fetchedList] : fetchedList;
      _isLoading = false;
    });
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
    return ListView.builder(
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
          return PokemonCard(item: pokemon);
        });
  }
}
