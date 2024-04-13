class PokeApiEndpoints {
  static const String BASE_URL = "https://pokeapi.co/api/v2/";
  static const String POKEMON = "pokemon";
  static const String POKEMON_SPECIES = "pokemon-species";
  static String createPokemonDetailURL(String pokemonId) {
    return "$BASE_URL$POKEMON/$pokemonId";
  }
  static String createPokemonSpeciesURL(String pokemonId) {
    return "$BASE_URL$POKEMON_SPECIES/$pokemonId";
  }
}