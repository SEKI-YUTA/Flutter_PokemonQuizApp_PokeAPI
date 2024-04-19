import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'UserData.freezed.dart';
part 'UserData.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String createdAt, 
    required int caughtPokemonCount,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
}
