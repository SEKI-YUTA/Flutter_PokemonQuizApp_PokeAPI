import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'dart:math' as math;
import 'package:pokemon_quiz_app/other/PokeApiEndpoints.dart';

class PokemonQuizScreen extends StatefulWidget {
  const PokemonQuizScreen({super.key});

  @override
  State<PokemonQuizScreen> createState() => _PokemonQuizScreenState();
}

class _PokemonQuizScreenState extends State<PokemonQuizScreen> {
  PokemonData? pokemonData;
  final TextEditingController _userAnswerController = TextEditingController();
  Future<void> _fetchRandomPokemonData() async {
    var maxCount = 1025;
    var randomNumber = math.Random().nextInt(maxCount) + 1;
    var data = await PokeApi.fetchPokemonDetail(
        PokeApiEndpoints.createPokemonDetailURL(randomNumber.toString()));
    setState(() {
      pokemonData = data;
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
    return pokemonData != null
        ? Column(
            children: [
              Image.network(pokemonData!.pokemonImageURL),
              Text(
                pokemonData!.pokemonName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
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
          )
        : const CenterMessage(
            message: "読み込み中...",
            showingLoadingIndicatoro: true,
          );
  }
}
