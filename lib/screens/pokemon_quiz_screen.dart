import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_quiz_app/components/HintItems.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/components/status_item.dart';
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
  bool _isLoading = false;
  final TextEditingController _userAnswerController = TextEditingController();
  Future<void> _fetchRandomPokemonData() async {
    setState(() {
      _isLoading = true;
    });
    var maxCount = 1025;
    var randomNumber = math.Random().nextInt(maxCount) + 1;
    var data = await PokeApi.fetchPokemonDetail(
        PokeApiEndpoints.createPokemonDetailURL(randomNumber.toString()));
    setState(() {
      pokemonData = data;
      _isLoading = false;
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
    return !_isLoading && pokemonData != null
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 300, maxHeight: 300),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.network(pokemonData!.pokemonImageURL),
                      ),
                    ),
                  ),
                  Text(pokemonData!.pokemonName),
                  Text(
                    "このポケモンの名前は？",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HintItems.hint1ExpansionTile(context, pokemonData!),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _userAnswerController,
                    decoration: const InputDecoration(
                      hintText: "ポケモンの名前(例：ピカチュウ)",
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("こたえ合わせをする")),
                  const SizedBox(height: 40),
                  ElevatedButton(onPressed: () {}, child: const Text("答えを見る")),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                        onPressed: () {
                          _fetchRandomPokemonData();
                        },
                        child: const Text("次の問題")),
                  ])
                ],
              ),
            ),
          )
        : const CenterMessage(
            message: "読み込み中...",
            showingLoadingIndicatoro: true,
          );
  }
}
