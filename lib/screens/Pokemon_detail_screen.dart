import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/model/PokemonListItem.dart';

class PokemonDetailScreen extends StatefulWidget {
  PokemonListItem pokemonItem;
  PokemonDetailScreen({super.key, required this.pokemonItem});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          children: [
            Image.network(widget.pokemonItem.pokemonImageURL),
            Text(
              widget.pokemonItem.pokemonName,
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        )));
  }
}
