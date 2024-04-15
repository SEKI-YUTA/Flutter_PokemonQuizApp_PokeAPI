import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/status_item.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/util/PokemonTypeConverter.dart';

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "こうげき",
            //       style: Theme.of(context).textTheme.bodyLarge,
            //     ),
            //     const SizedBox(width: 16),
            //     Text(pokemonData.attack.toString()),
            //     const SizedBox(width: 8),
            //     Expanded(
            //       child: LinearProgressIndicator(
            //         value: pokemonData.attack / 255,
            //         backgroundColor: Colors.grey,
            //         valueColor:
            //             const AlwaysStoppedAnimation<Color>(Colors.green),
            //       ),
            //     ),
            //   ],
            // ),
            StatusItem(
                title: "こうげき",
                value: pokemonData.attack,
                parentContext: context),
            StatusItem(
              title: "ぼうぎょ",
              value: pokemonData.defense,
              parentContext: context,
            ),
            StatusItem(
              title: "とくこう",
              value: pokemonData.specialAttack,
              parentContext: context,
            ),
            StatusItem(
                title: "とくぼう",
                value: pokemonData.specialDefense,
                parentContext: context),
            StatusItem(
              title: "すばやさ",
              value: pokemonData.speed,
              parentContext: context,
            ),
            const SizedBox(
              height: 16,
            ),
          ]),
    );
  }

  // 重さ高さタイプ
  static Widget hint2ExpansionTile(
      PokemonData pokemonData,
      ExpansionTileController controller,
      bool expansionEnabled,
      BuildContext context) {
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
                Text(
                  "重さ: ${pokemonData.weight / 10}kg",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "高さ: ${pokemonData.height / 10}m",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Wrap(
                  children: [
                    ...PokemonTypeConverter.convertTypeFromEnToBadge(
                        pokemonData.types.cast())
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 図鑑番号
  static Widget hint3ExpansionTile(
      PokemonData pokemonData,
      ExpansionTileController controller,
      bool expansionEnabled,
      BuildContext context) {
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
                Text(
                  "図鑑番号: ${pokemonData.id}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
