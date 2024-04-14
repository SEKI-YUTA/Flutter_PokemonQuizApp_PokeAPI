class PokemonListItem {
  final int id;
  final String pokemonName;
  final String pokemonImageURL;
  final int hp;
  final int attack;
  final int specialAttack;
  final int defense;
  final int specialDefense;
  final int speed;
  const PokemonListItem({
    required this.id,
    required this.pokemonName,
    required this.pokemonImageURL,
    required this.hp,
    required this.attack,
    required this.specialAttack,
    required this.defense,
    required this.specialDefense,
    required this.speed,
  });
}
