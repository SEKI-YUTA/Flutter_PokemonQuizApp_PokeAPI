import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_quiz_app/model/PokemonListItem.dart';
import 'package:pokemon_quiz_app/screens/Pokemon_detail_screen.dart';
import 'package:pokemon_quiz_app/screens/placeholder_screen.dart';

class PokemonCard extends StatefulWidget {
  PokemonListItem item;
  PokemonCard({super.key, required this.item});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  String _imageUrlStr = "";
  bool _isLoading = true;

  Future<void> _fetchPokemonInfo() async {
    var response = await http.get(Uri.parse(widget.item.url));
    var decoded = jsonDecode(response.body);
    if (mounted) {
      setState(() {
        _imageUrlStr =
            decoded['sprites']['other']['official-artwork']['front_default'];
        _isLoading = false;
      });
    }
  }

  @override
  initState() {
    super.initState();
    _fetchPokemonInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _isLoading
          ? const LoadingContent()
          : GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PokemonDetailScreen();
                }));
              },
              child: Row(
                children: [
                  Image.network(
                    _imageUrlStr,
                    width: 100,
                    height: 100,
                  ),
                  Text(widget.item.name,
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
    );
  }
}

class LoadingContent extends StatelessWidget {
  const LoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
