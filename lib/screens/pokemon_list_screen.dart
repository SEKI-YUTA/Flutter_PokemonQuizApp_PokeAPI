import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final String _baseURL = 'https://pokeapi.co/api/v2/';
  final String _pokemonListEndPoint = 'pokemon';
  List pokemonList = [];
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
    setState(() {
      nextURL = decoded['next'];
      pokemonList = appendMode!
          ? [...pokemonList, ...decoded['results']]
          : decoded['results'];
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchPokemonList(null);
    scrollController = ScrollController();
    scrollController.addListener(() async {
      print("max: ${scrollController.position.maxScrollExtent}");
      print("pos: ${scrollController.position.pixels}");
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.95 &&
          !_isLoading) {
        if (nextURL != null) {
          setState(() {
            _isLoading = true;
          });
          _fetchPokemonList(true);
          setState(() {
            _isLoading = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          var pokemon = pokemonList[index];
          return ListTile(
            title: Text(pokemon['name']),
            subtitle: Text(pokemon['url']),
          );
        });
  }
}
