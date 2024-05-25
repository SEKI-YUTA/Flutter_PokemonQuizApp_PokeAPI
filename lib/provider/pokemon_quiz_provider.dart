import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/data/FireStoreClient.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/QuizData.dart';
import 'package:pokemon_quiz_app/data/model/QuizStatus.dart';
import 'dart:math' as math;

import 'package:pokemon_quiz_app/other/PokeApiEndpoints.dart';

final pokemonQuizProvider =
    AutoDisposeAsyncNotifierProvider<PokemonQuiz, QuizData>(PokemonQuiz.new);

class PokemonQuiz extends AutoDisposeAsyncNotifier<QuizData> {
  @override
  Future<QuizData> build() async {
    return createPokemonQuizData();
  }

  Future<QuizData> createPokemonQuizData() async {
    var maxCount = 1025;
    var randomNumber = math.Random().nextInt(maxCount) + 1;
    var data = await PokeApi.fetchPokemonDetail(
        PokeApiEndpoints.createPokemonDetailURL(randomNumber.toString()));
    return QuizData(
        status: QuizStatus.NOT_ANSWERED,
        pokemonData: data,
        hintStep: 1,
        userAnswer: "");
  }

  Future<void> nextPokemonQuiz() async {
    try {
      state = const AsyncValue.loading();
      var data = await createPokemonQuizData();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  bool anserAction() {
    var quizData = state.value;
    if (quizData == null) {
      return false;
    }
    final isCorrect = quizData.pokemonData.pokemonName == quizData.userAnswer;
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
    state = state.whenData((data) => data.copyWith(
        status: isCorrect ? QuizStatus.CORRECT : QuizStatus.INCORRECT));
    return isCorrect;
  }

  void updateHintStep(int hintStep) {
    state = state.whenData((data) => data.copyWith(hintStep: hintStep));
  }

  void updateQuizStatus(QuizStatus status) {
    state = state.whenData((data) => data.copyWith(status: status));
  }

  void updateUserAnswer(String input) {
    state = state.whenData((data) => data.copyWith(userAnswer: input));
  }
}
