import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/auth/FirebaseAuthClient.dart';
import 'package:pokemon_quiz_app/data/model/AuthScreenState.dart';
import 'package:pokemon_quiz_app/data/model/FirebaseAuthResultStatus.dart';

final authScreenProvider =
    StateNotifierProvider<AuthScreenNotifier, AuthScreenState>(
        (ref) => AuthScreenNotifier());

class AuthScreenNotifier extends StateNotifier<AuthScreenState> {
  AuthScreenNotifier() : super(const AuthScreenState());

  void setIsLoginMode(bool isLoginMode) {
    state = state.copyWith(isLoginMode: isLoginMode);
  }

  void setIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setErrorMessage(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }

  void setIsPasswordVisible(bool isPasswordVisible) {
    state = state.copyWith(isPasswordVisible: isPasswordVisible);
  }

  Future<bool> loginOrRegisterAction() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      state = state.copyWith(errorMessage: "メールアドレスとパスワードを入力してください");
      return false;
    }
    state = state.copyWith(isLoading: true);
    FirebaseAuthResultStatus status;
    if (state.isLoginMode) {
      status = await FirebaseAuthClient.login(state.email, state.password);
    } else {
      status = await FirebaseAuthClient.register(state.email, state.password);
    }
    state = state.copyWith(
        errorMessage: FirebaseAuthClient.exceptionMessage(status));
    state = state.copyWith(isLoading: false);
    return status == FirebaseAuthResultStatus.Successful;
  }

  // Future<bool> authWithFirebaseAuth() async {
  //   await FirebaseAuth.instance
  //       .signInWithProvider(GoogleAuthProvider())
  //       .then((result) async {
  //     if (result.user != null) {
  //       var userDoc = FirebaseFirestore.instance
  //           .collection("users")
  //           .doc(result.user!.uid);
  //       await userDoc.set({
  //         "created_at": DateTime.now().millisecondsSinceEpoch,
  //         "name": result.user!.displayName,
  //         "email": result.user!.email,
  //         "photoURL": result.user!.photoURL
  //       });
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   });
  //   return false;
  // }

  Future<bool> authWithFirebaseAuth() async {
  try {
    final result = await FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());

    if (result.user != null) {
      var userDoc = FirebaseFirestore.instance.collection("users").doc(result.user!.uid);
      await userDoc.set({
        "created_at": DateTime.now().millisecondsSinceEpoch,
        "name": result.user!.displayName,
        "email": result.user!.email,
        "photoURL": result.user!.photoURL
      });
      return true;
    } else {
      return false;
    }
  } catch (e) {
    // エラーハンドリングをここで行います
    print('Error during authentication: $e');
    return false;
  }
}
}
