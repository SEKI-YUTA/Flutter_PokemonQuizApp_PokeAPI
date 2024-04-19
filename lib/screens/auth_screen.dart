import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/auth/FirebaseAuthClient.dart';
import 'package:pokemon_quiz_app/components/loading_dialog.dart';
import 'package:pokemon_quiz_app/data/model/FirebaseAuthResultStatus.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoginMode = true;
  bool _isPasswordVisible = false;
  String _errorMessage = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _loginOrRegisterAction() async {
    if (!_formKey.currentState!.validate()) return;
    if (mounted) {
      
      showDialog(
          context: context,
          builder: (context) => const LoadingDialog(message: "処理中..."));
    }
    FirebaseAuthResultStatus status;
    if (_isLoginMode) {
      status = await FirebaseAuthClient.login(
          _emailController.text, _passwordController.text);
    } else {
      status = await FirebaseAuthClient.register(
          _emailController.text, _passwordController.text);
    }
    setState(() {
      _errorMessage = FirebaseAuthClient.exceptionMessage(status);
    });
    if (mounted) {
      if (status == FirebaseAuthResultStatus.Successful) {
        Navigator.of(context).pushReplacementNamed('/mainHost');
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
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
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "メールアドレスを入力してください";
                                    } else if (!RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return "メールアドレスの形式が正しくありません";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      label: Text("メールアドレス")),
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "パスワードを入力してください";
                                    } else if (value.length < 6) {
                                      return "パスワードは6文字以上で入力してください";
                                    }
                                    return null;
                                  },
                                  obscureText: !_isPasswordVisible,
                                  decoration: InputDecoration(
                                      label: const Text("パスワード"),
                                      suffixIcon: IconButton(
                                        icon: Icon(_isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                      )),
                                ),
                              ],
                            )),
                        const SizedBox(height: 8),
                        Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                            onPressed: () async {
                              await _loginOrRegisterAction();
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
                              Navigator.of(context)
                                  .pushReplacementNamed('/mainHost');
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(result.user!.uid)
                                  .set({
                                "created_at":
                                    DateTime.now().millisecondsSinceEpoch,
                                "name": result.user!.displayName,
                                "email": result.user!.email,
                                "photoURL": result.user!.photoURL
                              });
                            }
                          });
                        }),
                        const SizedBox(
                          height: 40,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _isLoginMode = !_isLoginMode;
                              });
                              _emailController.text = "";
                              _passwordController.text = "";
                            },
                            child: Text(_isLoginMode ? "新規登録画面へ" : "ログイン画面へ")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
