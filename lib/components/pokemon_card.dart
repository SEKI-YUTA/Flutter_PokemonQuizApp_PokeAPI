import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/model/PokemonListItem.dart';
import 'package:pokemon_quiz_app/screens/pokemon_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  PokemonListItem item;
  PokemonCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return PokemonDetailScreen(pokemonItem: item);
          }));
        },
        child: Row(
          children: [
            Image.network(
              item.pokemonImageURL,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(item.pokemonName,
                style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}

class LoadingContent extends StatelessWidget {
  const LoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
