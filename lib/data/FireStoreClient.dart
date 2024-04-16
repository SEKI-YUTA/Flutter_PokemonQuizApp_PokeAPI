import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemon_quiz_app/data/model/CaughtPokemon.dart';

class FireStoreClient {
  static addCaughtPokemon(
    String uid,
    int pokemonId,
    int? caughtAt,
  ) {
    if (uid == "") return;
    caughtAt ??= DateTime.now().millisecondsSinceEpoch;
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("caughtPokemonList")
        .doc(pokemonId.toString())
        .set({
      "pokemonId": pokemonId,
      "caughtAt": caughtAt,
    });
  }

  static Future<List<CaughtPokemon>> getCaughtPokemonList(String uid) async {
    if (uid == "") return [];
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("caughtPokemonList")
        .get();
    snapshot.docs.map((doc) => doc.data()["pokemonId"]).toList();
    return snapshot.docs
        .map((pokemon) => CaughtPokemon(
            id: pokemon['pokemonId'], caughtAt: pokemon['caughtAt']))
        .toList();
  }
}
