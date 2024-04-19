import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemon_quiz_app/data/model/CaughtPokemon.dart';
import 'package:pokemon_quiz_app/data/model/UserData.dart';
import 'package:intl/intl.dart';

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

  static Future<UserData?> getUserData(String uid) async {
    if (uid == "") return null;
    final user = FirebaseFirestore.instance.collection("users").doc(uid);
    final accountCreatedAt =
        await user.get().then((data) => data['created_at']);
    final caughtPokemonCount = await user
            .collection("caughtPokemonList")
            .count()
            .get()
            .then((res) => res.count) ??
        0;
    final accountCreateDate =
        DateTime.fromMillisecondsSinceEpoch(accountCreatedAt);
    return UserData(
        createdAt: DateFormat('yyyy年MM月dd日').format(accountCreateDate),
        caughtPokemonCount: caughtPokemonCount);
  }
}
