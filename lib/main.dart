import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_quiz_app/firebase_options.dart';
import 'package:pokemon_quiz_app/main_host.dart';
import 'package:pokemon_quiz_app/screens/auth_screen.dart';
import 'package:pokemon_quiz_app/screens/splash_screen.dart';

void main() {
  runApp(const PokemonQuizApp());
}

class PokemonQuizApp extends StatefulWidget {
  const PokemonQuizApp({super.key});

  @override
  State<PokemonQuizApp> createState() => _PokemonQuizAppState();
}

class _PokemonQuizAppState extends State<PokemonQuizApp> {

  @override
  void initState() {
    // TODO: implement initState
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
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        '/splash': (BuildContext context) => const SplashScreen(),
        '/mainHost': (BuildContext context) => const MainHost(),
        '/auth': (BuildContext context) => const AuthScreen()
      },
    );
  }
}
