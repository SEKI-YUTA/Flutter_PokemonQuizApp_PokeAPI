import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/main_host.dart';

void main() {
  runApp(const PokemonQuizApp());
}

class PokemonQuizApp extends StatelessWidget {
  const PokemonQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainHost(),
    );
  }
}

