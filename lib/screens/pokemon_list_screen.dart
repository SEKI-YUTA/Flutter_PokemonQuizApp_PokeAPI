import 'dart:convert';

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

  Future<void> _fetchPokemonList() async {
    var response = await http.get(Uri.parse(_baseURL + _pokemonListEndPoint));
    var decoded = jsonDecode(response.body);
    setState(() {
      nextURL = decoded['next'];
      pokemonList = decoded['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
