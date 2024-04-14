import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'package:pokemon_quiz_app/other/PokeApiEndpoints.dart';

class PokemonQuizScreen extends StatefulWidget {
  const PokemonQuizScreen({super.key});

  @override
  State<PokemonQuizScreen> createState() => _PokemonQuizScreenState();
}

class _PokemonQuizScreenState extends State<PokemonQuizScreen> {
  String? imageURL;
  String? pokemonName;
  final TextEditingController _userAnswerController = TextEditingController();
  Future<void> _fetchRandomPokemonData() async {
    var maxCount = 1025;
    var randomNumber = math.Random().nextInt(maxCount) + 1;
    var pokemonData = await http.get(Uri.parse(
        PokeApiEndpoints.createPokemonDetailURL(randomNumber.toString())));
    var parsedData = jsonDecode(pokemonData.body);
    print("randomId: $randomNumber");
    print(parsedData['name']);
    print(parsedData['sprites']['other']['front_default']);
    setState(() {
      pokemonName = parsedData['name'];
      imageURL =
          parsedData['sprites']['other']['official-artwork']['front_default'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchRandomPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imageURL != null ? Image.network(imageURL!) : Container(),
        pokemonName != null
            ? Text(
                pokemonName!,
                style: Theme.of(context).textTheme.headlineSmall,
              )
            : Container(),
        Text("基本ステータス"),
        Column(
          children: [
            Text("こうげき"),
            Text("ぼうぎょ"),
            Text("とくこう"),
            Text("とくぼう"),
            Text("すばやさ"),
            Text("HP")
          ],
        ),
        TextField(
          controller: _userAnswerController,
          decoration: const InputDecoration(
            hintText: "ポケモンの名前(例：ピカチュウ)",
          ),
          maxLines: 1,
        ),
        ElevatedButton(onPressed: () {}, child: const Text("答えを見る")),
        ElevatedButton(
            onPressed: () {
              _fetchRandomPokemonData();
            },
            child: const Text("次の問題")),
      ],
    );
  }
}
