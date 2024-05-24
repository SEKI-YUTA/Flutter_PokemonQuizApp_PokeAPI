import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/data/PokeApi.dart';
import 'package:pokemon_quiz_app/data/model/QuizData.dart';
import 'package:pokemon_quiz_app/data/model/QuizStatus.dart';
import 'dart:math' as math;

import 'package:pokemon_quiz_app/other/PokeApiEndpoints.dart';


final pokemonQuizProvider =
    AsyncNotifierProvider<PokemonQuiz, QuizData>(PokemonQuiz.new);

class PokemonQuiz extends AsyncNotifier<QuizData> {
  @override
  Future<QuizData> build() async {
    return await createPokemonQuizData();
  }

  Future<QuizData> createPokemonQuizData() async {
    var maxCount = 1025;
    var randomNumber = math.Random().nextInt(maxCount) + 1;
    var data = await PokeApi.fetchPokemonDetail(
        PokeApiEndpoints.createPokemonDetailURL(randomNumber.toString()));
    return QuizData(pokemonData: data, hintStep: 1);
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

  void updateHintStep(int hintStep) {
    state = state.whenData((data) => data.copyWith(hintStep: hintStep));
  }

  void updateQuizStatus(QuizStatus status) {
    state = state.whenData((data) => data.copyWith(status: status));
  }
}
