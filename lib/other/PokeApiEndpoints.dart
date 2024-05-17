// ignore_for_file: constant_identifier_names

class PokeApiEndpoints {
  static const String BASE_URL = "https://pokeapi.co/api/v2/";
  static const String POKEMON = "pokemon";
  static const String POKEMON_SPECIES = "pokemon-species";
  static String createPokemonListURL(int offset, int fetchSize) {
    return "$BASE_URL$POKEMON?offset=$offset&limit=$fetchSize";
  }
  static String createPokemonDetailURL(String pokemonId) {
    return "$BASE_URL$POKEMON/$pokemonId";
  }
  static String createPokemonSpeciesURL(String pokemonId) {
    return "$BASE_URL$POKEMON_SPECIES/$pokemonId";
  }
}