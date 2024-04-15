import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreClient {
  static addCaughtPokemon(
    int pokemonId,
    int? caughtAt,
  ) {
    caughtAt ??= DateTime.now().millisecondsSinceEpoch;
    FirebaseFirestore.instance
        .collection("users")
        .doc("testUser1")
        .collection("caughtPokemonList")
        .doc(pokemonId.toString())
        .set({
      "pokemonId": pokemonId,
      "caughtAtSec": caughtAt,
    });
  }
}
