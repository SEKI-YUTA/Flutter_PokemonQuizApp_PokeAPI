import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/data/FireStoreClient.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  Future<void> _readData() async {
    var list = await FireStoreClient.getCaughtPokemonList();
    print("caughtPokemonList $list");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readData();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("BOX画面"),
    );
  }
}
