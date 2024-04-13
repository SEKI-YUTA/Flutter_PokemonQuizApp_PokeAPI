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
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isLoginMode ? "ログイン" : "新規登録",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(label: Text("メールアドレス")),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                      label: const Text("パスワード"),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      )),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () {
                      print("email: ${_emailController.text}");
                      print("password: ${_passwordController.text}");
                    },
                    child: Text(_isLoginMode ? "ログイン" : "新規登録")),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                SignInButton(Buttons.google, onPressed: () {
                  FirebaseAuth.instance
                      .signInWithProvider(GoogleAuthProvider())
                      .then((result) {
                    print("auth result: $result");
                    if (result.user != null) {
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
                TextButton(
                    onPressed: () {
                      setState(() {
                        _isLoginMode = !_isLoginMode;
                      });
                      _emailController.text = "";
                      _passwordController.text = "";
                    },
                    child: Text(_isLoginMode ? "新規登録画面へ" : "ログイン画面へ")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/mainHost');
                    },
                    child: Text("Navigate to mainHost"))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
