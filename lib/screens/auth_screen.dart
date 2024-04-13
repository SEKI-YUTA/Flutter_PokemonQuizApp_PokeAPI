import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoginMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Column(
          children: [
            Text(_isLoginMode ? "ログイン" : "新規登録"),
            SignInButton(Buttons.google, onPressed: () {
              FirebaseAuth.instance
                  .signInWithProvider(GoogleAuthProvider())
                  .then((result) {
                print("auth result: $result");
                if (result.user != null) {
                  print("auth result: ${result.user!.uid}");
                  Navigator.of(context).pushReplacementNamed('/mainHost');
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(result.user!.uid)
                      .set({
                    "created_at": DateTime.now().millisecondsSinceEpoch,
                    "name": result.user!.displayName,
                    "email": result.user!.email,
                    "photoURL": result.user!.photoURL
                  });
                }
              });
            }),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/mainHost');
                },
                child: Text("Navigate to mainHost"))
          ],
        ));
  }
}
