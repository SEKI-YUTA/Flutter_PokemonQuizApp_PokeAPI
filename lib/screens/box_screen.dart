import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/data/FireStoreClient.dart';

class BoxScreen extends StatefulWidget {
  const BoxScreen({super.key});

  @override
  State<BoxScreen> createState() => _BoxScreenState();
}

class _BoxScreenState extends State<BoxScreen> {
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
