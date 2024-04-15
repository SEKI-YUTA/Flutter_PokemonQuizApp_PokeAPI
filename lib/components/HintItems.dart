import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/status_item.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';

class HintItems {
  static Widget hint1ExpansionTile(
      BuildContext context, PokemonData pokemonData) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
          title: const Text("ヒント1"),
          initiallyExpanded: true,
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
            ),
          ]),
    );
  }

  // 重さ高さタイプ
  static Widget hint2ExpansionTile(PokemonData pokemonData,
      ExpansionTileController controller, bool expansionEnabled) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: const Text("ヒント2"),
        controller: controller,
        enabled: expansionEnabled,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("重さ: ${pokemonData.weight / 10}kg"),
                Text("高さ: ${pokemonData.height / 10}m"),
                Text("タイプ: ${pokemonData.types.join(", ")}"),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 図鑑番号
  static Widget hint3ExpansionTile(PokemonData pokemonData,
      ExpansionTileController controller, bool expansionEnabled) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: const Text("ヒント3"),
        controller: controller,
        enabled: expansionEnabled,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("図鑑番号: ${pokemonData.id}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
