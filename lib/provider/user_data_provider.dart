import 'package:pokemon_quiz_app/data/FireStoreClient.dart';
import 'package:pokemon_quiz_app/data/model/UserData.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod/riverpod.dart';

part 'user_data_provider.g.dart';

@riverpod
Future<UserData?> getUserData(GetUserDataRef ref, String uid) async {
  return FireStoreClient.getUserData(uid);
}