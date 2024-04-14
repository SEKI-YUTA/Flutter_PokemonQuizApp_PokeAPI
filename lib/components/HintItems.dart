import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/status_item.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

class HintItems {
  static ExpansionTile hint1ExpansionTile(
      BuildContext context, PokemonData pokemonData) {
    return ExpansionTile(
        title: const Text("ヒント1"),
        initiallyExpanded: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "基本ステータス",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    "HP: ${pokemonData.hp}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              StatusItem(title: "こうげき", value: pokemonData.attack),
              StatusItem(title: "ぼうぎょ", value: pokemonData.defense),
              StatusItem(title: "とくこう", value: pokemonData.specialAttack),
              StatusItem(title: "とくぼう", value: pokemonData.specialDefense),
              StatusItem(title: "すばやさ", value: pokemonData.speed),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ]);
  }
}
