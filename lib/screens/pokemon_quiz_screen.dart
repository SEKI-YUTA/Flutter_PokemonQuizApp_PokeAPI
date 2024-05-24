import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokemon_quiz_app/components/HintItems.dart';
import 'package:pokemon_quiz_app/components/center_message.dart';
import 'package:pokemon_quiz_app/components/correct_answer_for_debug.dart';
import 'package:pokemon_quiz_app/components/question_image.dart';
import 'package:pokemon_quiz_app/components/quiz_result_dialog.dart';
import 'package:pokemon_quiz_app/data/FireStoreClient.dart';
import 'package:pokemon_quiz_app/data/model/QuizData.dart';
import 'package:pokemon_quiz_app/data/model/QuizStatus.dart';
import 'package:pokemon_quiz_app/provider/pokemon_quiz_provider.dart';

class PokemonQuizScreen extends ConsumerStatefulWidget {
  const PokemonQuizScreen({super.key});

  @override
  ConsumerState<PokemonQuizScreen> createState() => _PokemonQuizScreenState();
}

class _PokemonQuizScreenState extends ConsumerState<PokemonQuizScreen> {
  // QuizData? _quizData;
  // bool _isLoading = false;
  final TextEditingController _userAnswerController = TextEditingController();
  final ExpansionTileController hint2Controller = ExpansionTileController();
  final ExpansionTileController hint3Controller = ExpansionTileController();

  // Future<void> _fetchRandomPokemonData() async {
  //   _userAnswerController.text = "";
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   var maxCount = 1025;
  //   var randomNumber = math.Random().nextInt(maxCount) + 1;
  //   var data = await PokeApi.fetchPokemonDetail(
  //       PokeApiEndpoints.createPokemonDetailURL(randomNumber.toString()));
  //   if (mounted) {
  //     setState(() {
  //       _quizData = QuizData(
  //           pokemonData: data, hintStep: 1, status: QuizStatus.NOT_ANSWERED);
  //       _isLoading = false;
  //     });
  //   }
  // }

  Future<void> _answerAction() async {
    var quizData = ref.read(pokemonQuizProvider).value;
    if (quizData == null) {
      return;
    }
    final isCorrect =
        quizData.pokemonData.pokemonName == _userAnswerController.text;
    if (isCorrect) {
      FireStoreClient.addCaughtPokemon(FirebaseAuth.instance.currentUser!.uid,
          quizData.pokemonData.id, DateTime.now().millisecondsSinceEpoch);
    }
    final player = AudioPlayer();
    player.play(
        AssetSource(isCorrect
            ? "sounds/correct_sound.mp3"
            : "sounds/incorrect_sound.mp3"),
        mode: PlayerMode.lowLatency,
        volume: 1);
    setState(() {
      quizData = quizData!.copyWith(
          status: isCorrect ? QuizStatus.CORRECT : QuizStatus.INCORRECT);
    });
    showDialog(
        context: context,
        builder: (context) => QuizResultDialog(
              isCorrect: isCorrect,
              pokemonName: quizData!.pokemonData.pokemonName,
              pokemonImageUrl: quizData!.pokemonData.pokemonImageURL,
              onNextClick: () {
                Navigator.of(context).pop();
                // _fetchRandomPokemonData();
              },
            ));
  }

  @override
  void initState() {
    // _fetchRandomPokemonData();
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
                              ref
                                  .read(pokemonQuizProvider.notifier)
                                  .updateHintStep(2);
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
                            ref
                                .read(pokemonQuizProvider.notifier)
                                .updateHintStep(3);
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
                          _answerAction();
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
                        setState(() {
                          quizData =
                              quizData.copyWith(status: QuizStatus.GIVE_UP);
                        });
                      }
                    : null,
                child: const Text("答えを見る")),
            const SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                  onPressed: () {
                    // _fetchRandomPokemonData();
                    ref.read(pokemonQuizProvider.notifier).nextPokemonQuiz();
                  },
                  child: const Text("次の問題")),
            ])
          ],
        ),
      ),
    );
  }
}
