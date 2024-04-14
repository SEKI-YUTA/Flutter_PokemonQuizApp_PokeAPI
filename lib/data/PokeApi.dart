import 'dart:convert';

import 'package:pokemon_quiz_app/data/model/PokemonListItem.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_quiz_app/other/PokeApiEndpoints.dart';

class PokeApi {
  static Future<(List<PokemonListItem?>, String)> fetchPokemonList(String? fetchUrl) async {
    fetchUrl ??= "${PokeApiEndpoints.BASE_URL}/${PokeApiEndpoints.POKEMON}";
    var response = await http.get(Uri.parse(fetchUrl));
    var decoded = jsonDecode(response.body);
    String nextUrl = decoded['next'];
    List<Future<void>> futureList = [];
    List<PokemonListItem?> list =
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

  static Future<PokemonListItem> fetchPokemonDetail(String detailURL) async {
    var detailResponse = await http.get(Uri.parse(detailURL));
    var detailDecoded = jsonDecode(detailResponse.body);
    var speciesResponse =
        await http.get(Uri.parse(detailDecoded['species']['url']));
    var speciesDecoded = jsonDecode(speciesResponse.body);
    var data = PokemonListItem(
      pokemonName: speciesDecoded['names']
          .where((item) => item['language']['name'] == 'ja-Hrkt')
          .first['name'],
      pokemonImageURL: detailDecoded['sprites']['other']['official-artwork']
          ['front_default'],
    );
    return data;
  }
}