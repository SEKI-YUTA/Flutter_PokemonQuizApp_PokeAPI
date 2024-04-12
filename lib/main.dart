import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/firebase_options.dart';
import 'package:pokemon_quiz_app/main_host.dart';

void main() {
  runApp(const PokemonQuizApp());
}

class PokemonQuizApp extends StatefulWidget {
  const PokemonQuizApp({super.key});

  @override
  State<PokemonQuizApp> createState() => _PokemonQuizAppState();
}

class _PokemonQuizAppState extends State<PokemonQuizApp> {
  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    initFirebase();
    super.initState();
  }

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
