import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/main_host.dart';
import 'package:pokemon_quiz_app/screens/auth_screen.dart';
import 'package:pokemon_quiz_app/screens/destination_screen.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ThemeMode.system;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      initialRoute: '/destination',
      routes: <String, WidgetBuilder>{
        '/destination': (BuildContext context) => const DestinationScreen(),
        '/mainHost': (BuildContext context) => const MainHost(),
        '/auth': (BuildContext context) => const AuthScreen()
      },
    );
  }
}
