import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon_quiz_app/data/FireStoreClient.dart';
import 'package:pokemon_quiz_app/data/model/CaughtPokemon.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_quiz_app/other/PokeApiEndpoints.dart';

class PokeApi {
  static Future<List<PokemonData?>> fetchPokemonListWithOffsetIndex(
      int? offset, int? fetchSize) async {
    offset = offset ?? 0;
    fetchSize = fetchSize ?? 20;
    var response = await http.get(
        Uri.parse(PokeApiEndpoints.createPokemonListURL(offset, fetchSize)));
    var decoded = jsonDecode(response.body);
    List<Future<void>> futureList = [];
    List<PokemonData?> list =
        List.generate(decoded['results'].length, (item) => null);
    for (int i = 0; i < decoded['results'].length; i++) {
      var item = decoded['results'][i];
      var f = fetchPokemonDetail(item['url']).then((value) {
        list[i] = value;
      });
      futureList.add(f);
    }
    await Future.wait(futureList);
    return list;
  }

  static Future<List<PokemonData?>> fetchCaughtPokemonListWithOffsetIndex(
      List<CaughtPokemon> caughtPokemonList,
      int? offset,
      int? fetchSize) async {
    offset = offset ?? 0;
    fetchSize = fetchSize ?? 20;
    var addPokemonList = <PokemonData>[];
    var futureList = <Future>[];
    for (int i = offset; i < offset + fetchSize; i++) {
      if (i >= caughtPokemonList.length) {
        break;
      }
      var f = PokeApi.fetchPokemonDetail(
              PokeApiEndpoints.createPokemonDetailURL(
                  caughtPokemonList[i].id.toString()))
          .then((pokemon) => addPokemonList.add(pokemon));
      futureList.add(f);
    }
    await Future.wait(futureList);
    return addPokemonList;
  }

  // こっちは近いうちに消す予定
  static Future<(List<PokemonData?>, String)> fetchPokemonList(
      String? fetchUrl) async {
    fetchUrl ??= "${PokeApiEndpoints.BASE_URL}${PokeApiEndpoints.POKEMON}";
    var response = await http.get(Uri.parse(fetchUrl));
    var decoded = jsonDecode(response.body);
    String nextUrl = decoded['next'];
    List<Future<void>> futureList = [];
    List<PokemonData?> list =
        List.generate(decoded['results'].length, (item) => null);
    for (int i = 0; i < decoded['results'].length; i++) {
      var item = decoded['results'][i];
      var f = fetchPokemonDetail(item['url']).then((value) {
        list[i] = value;
      });
      futureList.add(f);
    }
    await Future.wait(futureList);
    return (list, nextUrl);
  }

  static Future<PokemonData> fetchPokemonDetail(String detailURL) async {
    var detailResponse = await http.get(Uri.parse(detailURL));
    var detailDecoded = jsonDecode(detailResponse.body);
    var speciesResponse =
        await http.get(Uri.parse(detailDecoded['species']['url']));
    var speciesDecoded = jsonDecode(speciesResponse.body);
    var data = PokemonData(
      id: detailDecoded['id'] ?? -1,
      pokemonName: speciesDecoded['names']
              .where((item) => item['language']['name'] == 'ja-Hrkt')
              .first['name'] ??
          "",
      pokemonImageURL: detailDecoded['sprites']['other']['official-artwork']
              ['front_default'] ??
          "",
      hp: detailDecoded['stats']
              .where((item) => item['stat']['name'] == 'hp')
              .first['base_stat'] ??
          0,
      attack: detailDecoded['stats']
              .where((item) => item['stat']['name'] == 'attack')
              .first['base_stat'] ??
          0,
      specialAttack: detailDecoded['stats']
              .where((item) => item['stat']['name'] == 'special-attack')
              .first['base_stat'] ??
          0,
      defense: detailDecoded['stats']
          .where((item) => item['stat']['name'] == 'defense')
          .first['base_stat'],
      specialDefense: detailDecoded['stats']
              .where((item) => item['stat']['name'] == 'special-defense')
              .first['base_stat'] ??
          0,
      speed: detailDecoded['stats']
              .where((item) => item['stat']['name'] == 'speed')
              .first['base_stat'] ??
          0,
      weight: detailDecoded['weight'] ?? 0,
      height: detailDecoded['height'] ?? 0,
      types:
          detailDecoded['types'].map((item) => item['type']['name']).toList(),
    );
    return data;
  }
}
