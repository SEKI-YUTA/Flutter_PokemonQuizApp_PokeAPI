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
            SignInButton(Buttons.google, onPressed: () {}),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/mainHost');
                },
                child: Text("Navigate to mainHost"))
          ],
        ));
  }
}
