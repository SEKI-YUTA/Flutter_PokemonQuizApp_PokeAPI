import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

class PokemonCard extends StatelessWidget {
  PokemonData item;
  Function()? onPressed;
  Function()? onLongPress;
  PokemonCard(
      {super.key, required this.item, this.onPressed, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        onLongPress: onLongPress,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: item.pokemonImageURL != ""
                  ? Image.network(
                      item.pokemonImageURL,
                    )
                  : Container(),
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
