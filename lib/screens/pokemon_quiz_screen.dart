import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/HintItems.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/components/quiz_result_dialog.dart';
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

  Future<void> _answerAction() async {
    final isCorrect = pokemonData!.pokemonName == _userAnswerController.text;
    final player = AudioPlayer();
    player.play(
        AssetSource(isCorrect
            ? "sounds/correct_sound.mp3"
            : "sounds/incorrect_sound.mp3"),
        mode: PlayerMode.lowLatency,
        volume: 1);
    showDialog(
        context: context,
        builder: (context) => QuizResultDialog(
              isCorrect: isCorrect,
              onNextClick: () {
                Navigator.of(context).pop();
                _fetchRandomPokemonData();
              },
            ));
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
                      onPressed: () async {
                        _answerAction();
                      },
                      child: const Text("こたえ合わせをする")),
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
