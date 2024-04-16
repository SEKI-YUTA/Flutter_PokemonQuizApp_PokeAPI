import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

class PokemonDetailScreen extends StatefulWidget {
  final PokemonData pokemonItem;
  final bool shouldShowStatus;
  const PokemonDetailScreen(
      {super.key, required this.pokemonItem, this.shouldShowStatus = false});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('ポケモン詳細'),
        ));
  }
}
