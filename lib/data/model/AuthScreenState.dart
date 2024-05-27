import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'AuthScreenState.freezed.dart';
part 'AuthScreenState.g.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  const factory AuthScreenState({
    @Default(true) bool isLoginMode,
    @Default(false) bool isLoading,
    @Default("") String email,
    @Default("") String password,
    @Default("") String errorMessage,
    @Default(false) bool isPasswordVisible
  }) = _AuthScreenState;

  factory AuthScreenState.fromJson(Map<String, Object?> json) =>
      _$AuthScreenStateFromJson(json);
}