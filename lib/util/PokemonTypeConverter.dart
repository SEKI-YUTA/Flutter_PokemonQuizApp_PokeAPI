import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/type_badge.dart';
import 'package:pokemon_quiz_app/data/ConstantValues.dart';

class PokemonTypeConverter {
  static String convertTypeFromEnToJa(String typeInEnglish) {
    return pokemonTypeMapList
            .where((item) => item['typeEn'] == typeInEnglish)
            .first['data']['typeJa']
            .toString() ??
        "不明";
  }

  static List<Widget> convertTypeFromEnToBadge(List<String> types) {
    return List.of(
      types.map((typeEn) {
        var data = pokemonTypeMapList.where((item) => item['typeEn'] == typeEn);
        return TypeBadge(data: data.first);
      }),
    );
  }
}
