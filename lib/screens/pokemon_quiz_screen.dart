import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokemon_quiz_app/components/HintItems.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/components/correct_answer_for_debug.dart';
import 'package:pokemon_quiz_app/components/question_image.dart';
import 'package:pokemon_quiz_app/components/quiz_result_dialog.dart';
import 'package:pokemon_quiz_app/data/model/QuizData.dart';
import 'package:pokemon_quiz_app/data/model/QuizStatus.dart';
import 'package:pokemon_quiz_app/provider/pokemon_quiz_provider.dart';

class PokemonQuizScreen extends ConsumerStatefulWidget {
  const PokemonQuizScreen({super.key});

  @override
  ConsumerState<PokemonQuizScreen> createState() => _PokemonQuizScreenState();
}

class _PokemonQuizScreenState extends ConsumerState<PokemonQuizScreen> {
  final TextEditingController _userAnswerController = TextEditingController();
  final ExpansionTileController hint2Controller = ExpansionTileController();
  final ExpansionTileController hint3Controller = ExpansionTileController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var quizData = ref.watch(pokemonQuizProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            quizData.when(
                data: (data) => dataContent(data),
                error: (error, stackTrace) => const CenterMessage(
                      message: "エラーが発生しました",
                    ),
                loading: loadingContent)
          ],
        ),
      ),
    );
  }

  Widget loadingContent() {
    return const CenterMessage(
      message: "ポケモンクイズを作成中\n少しまってね。",
      showingLoadingIndicatoro: true,
    );
  }

  Widget dataContent(QuizData quizData) {
    var pokemonData = quizData.pokemonData;
    var pokemonQuizNotifier = ref.read(pokemonQuizProvider.notifier);
    return Flexible(
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
                  child: quizData.status == QuizStatus.NOT_ANSWERED
                      ? const QuestionImage()
                      : Image.network(pokemonData.pokemonImageURL),
                ),
              ),
            ),
            quizData.status == QuizStatus.NOT_ANSWERED
                ? Text("このポケモンの名前は？",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.red))
                : Text(
                    pokemonData.pokemonName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
            kDebugMode
                ? CorrectAnswerForDevug(text: "答え：${pokemonData.pokemonName}")
                : Container(),
            const SizedBox(
              height: 16,
            ),
            HintItems.hint1ExpansionTile(context, pokemonData),
            const SizedBox(height: 16),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                HintItems.hint2ExpansionTile(pokemonData, hint2Controller,
                    quizData.hintStep >= 2, context),
                quizData.hintStep < 2
                    ? ElevatedButton(
                        onPressed: () {
                          if (quizData.hintStep == 1) {
                            setState(() {
                              hint2Controller.expand();
                              pokemonQuizNotifier.updateHintStep(2);
                            });
                          }
                        },
                        child: const Text("ヒント2を見る"))
                    : Container()
              ],
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                HintItems.hint3ExpansionTile(pokemonData, hint3Controller,
                    quizData.hintStep >= 3, context),
                quizData.hintStep < 3
                    ? ElevatedButton(
                        onPressed: () {
                          if (quizData.hintStep == 2) {
                            hint3Controller.expand();
                            pokemonQuizNotifier.updateHintStep(3);
                          }
                        },
                        child: const Text("ヒント3を見る"))
                    : Container()
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _userAnswerController,
              decoration: const InputDecoration(
                hintText: "ポケモンの名前(例：ピカチュウ)",
              ),
              maxLines: 1,
              onChanged: (value) => pokemonQuizNotifier.updateUserAnswer(value),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: quizData.status == QuizStatus.NOT_ANSWERED
                    ? () {
                        if (_userAnswerController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "ポケモンの名前を入力してください");
                        } else {
                          var isCorrect = pokemonQuizNotifier.anserAction();
                          showDialog(
                              context: context,
                              builder: (context) => QuizResultDialog(
                                    isCorrect: isCorrect,
                                    pokemonName: pokemonData.pokemonName,
                                    pokemonImageUrl:
                                        pokemonData.pokemonImageURL,
                                    onNextClick: () {
                                      Navigator.of(context).pop();
                                      pokemonQuizNotifier.nextPokemonQuiz();
                                      _userAnswerController.clear();
                                    },
                                  ));
                        }
                      }
                    : null,
                child: const Text("こたえ合わせをする")),
            const SizedBox(height: 40),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text(
                "答え: ",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 16,
              ),
              quizData.status == QuizStatus.NOT_ANSWERED
                  ? Container()
                  : Text(
                      quizData.pokemonData.pokemonName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
            ]),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: quizData.status == QuizStatus.NOT_ANSWERED
                    ? () {
                        pokemonQuizNotifier.giveUp();
                      }
                    : null,
                child: const Text("答えを見る")),
            const SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                  onPressed: () {
                    // _fetchRandomPokemonData();
                    pokemonQuizNotifier.nextPokemonQuiz();
                    _userAnswerController.clear();
                  },
                  child: const Text("次の問題")),
            ]),
          ],
        ),
      ),
    );
  }
}
