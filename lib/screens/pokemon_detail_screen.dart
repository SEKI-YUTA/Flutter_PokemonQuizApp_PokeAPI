import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

class PokemonDetailScreen extends StatefulWidget {
  final PokemonData pokemonItem;
  const PokemonDetailScreen({super.key, required this.pokemonItem});

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
