import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/status_item.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/util/PokemonTypeConverter.dart';

class HintItems {
  static Widget hintItemFooter = const Column(
    children: [
      SizedBox(
        height: 16,
      ),
      Divider()
    ],
  );

  static Widget hint1ExpansionTile(
      BuildContext context, PokemonData pokemonData) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
          title: Text(
            "ヒント1",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          initiallyExpanded: true,
          children: [
            Text(
              "基本ステータス",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            StatusItem(
              title: "HP",
              value: pokemonData.hp,
              parentContext: context,
              requireIndicator: false,
            ),
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
            hintItemFooter
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
        title: Text("ヒント2",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            )),
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
          ),
          hintItemFooter
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
        title: Text(
          "ヒント3",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
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
          ),
          hintItemFooter
        ],
      ),
    );
  }
}
