import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/components/status_item.dart';
import 'package:pokemon_quiz_app/data/model/PokemonData.dart';
import 'package:pokemon_quiz_app/util/PokemonTypeConverter.dart';

class PokemonDetailScreen extends StatefulWidget {
  final PokemonData pokemonData;
  final bool shouldShowStatus;
  const PokemonDetailScreen(
      {super.key, required this.pokemonData, this.shouldShowStatus = false});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: double.infinity,
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 300, maxHeight: 300),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.network(widget.pokemonData.pokemonImageURL),
                  ),
                ),
              ),
              Text(
                widget.pokemonData.pokemonName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                  "図鑑番号: ${widget.shouldShowStatus ? widget.pokemonData.id : '???'}"),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                children: [
                  ...PokemonTypeConverter.convertTypeFromEnToBadge(
                      widget.pokemonData.types.cast())
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              StatusItem(
                title: "HP",
                value: widget.pokemonData.hp,
                parentContext: context,
                requireIndicator: false,
                maskText: widget.shouldShowStatus ? null : "???",
              ),
              StatusItem(
                title: "こうげき",
                value: widget.pokemonData.attack,
                parentContext: context,
                maskText: widget.shouldShowStatus ? null : "???",
              ),
              StatusItem(
                title: "ぼうぎょ",
                value: widget.pokemonData.defense,
                parentContext: context,
                maskText: widget.shouldShowStatus ? null : "???",
              ),
              StatusItem(
                title: "とくこう",
                value: widget.pokemonData.specialAttack,
                parentContext: context,
                maskText: widget.shouldShowStatus ? null : "???",
              ),
              StatusItem(
                title: "とくぼう",
                value: widget.pokemonData.specialDefense,
                parentContext: context,
                maskText: widget.shouldShowStatus ? null : "???",
              ),
              StatusItem(
                title: "すばやさ",
                value: widget.pokemonData.speed,
                parentContext: context,
                maskText: widget.shouldShowStatus ? null : "???",
              ),
              const SizedBox(height: 16),
            ]),
          ),
        ));
  }
}
