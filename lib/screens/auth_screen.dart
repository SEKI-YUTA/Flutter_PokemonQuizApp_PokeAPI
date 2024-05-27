import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/provider/auth_screen_state_provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _loginOrRegisterAction() async {
    if (!_formKey.currentState!.validate()) return;
    var authScreenStateNotifier = ref.read(authScreenProvider.notifier);
    var isAuthSuccessful =
        await authScreenStateNotifier.loginOrRegisterAction();
    if (isAuthSuccessful && mounted) {
      Navigator.of(context).pushReplacementNamed("/mainHost");
    }
  }

  Future<void> _authWithFirebaseAuth() async {
    var authScreenStateNotifier = ref.read(authScreenProvider.notifier);
    var isAuthSuccessful =  await authScreenStateNotifier.authWithFirebaseAuth();
    print(isAuthSuccessful);
    if (isAuthSuccessful && mounted) {
      Navigator.of(context).pushReplacementNamed("/mainHost");
    }
  }

  @override
  Widget build(BuildContext context) {
    var authScreenStateNotifier = ref.read(authScreenProvider.notifier);
    var authScreenState = ref.watch(authScreenProvider);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (authScreenState.isLoading) {
    //     _showLogindDialog();
    //   } else {
    //     if (Navigator.canPop(context)) {
    //       Navigator.of(context).pop();
    //     }
    //   }
    // });

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
                          authScreenState.isLoginMode ? "ログイン" : "新規登録",
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
                                  onChanged: (value) {
                                    authScreenStateNotifier.setEmail(value);
                                  },
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
                                  obscureText:
                                      !authScreenState.isPasswordVisible,
                                  decoration: InputDecoration(
                                      label: const Text("パスワード"),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            authScreenState.isPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                        onPressed: () {
                                          authScreenStateNotifier
                                              .setIsPasswordVisible(
                                                  !authScreenState
                                                      .isPasswordVisible);
                                        },
                                      )),
                                  onChanged: (value) {
                                    authScreenStateNotifier.setPassword(value);
                                  },
                                ),
                              ],
                            )),
                        const SizedBox(height: 8),
                        Text(
                          authScreenState.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                            onPressed: () async {
                              if (authScreenState.isLoading) return;
                              await _loginOrRegisterAction();
                            },
                            child: Text(
                                authScreenState.isLoginMode ? "ログイン" : "新規登録")),
                        const SizedBox(height: 8),
                        const Divider(),
                        const SizedBox(height: 8),
                        SignInButton(Buttons.google, onPressed: () {
                          _authWithFirebaseAuth();
                        }),
                        const SizedBox(
                          height: 40,
                        ),
                        TextButton(
                            onPressed: () {
                              authScreenStateNotifier
                                  .setIsLoginMode(!authScreenState.isLoginMode);
                              _emailController.text = "";
                              _passwordController.text = "";
                            },
                            child: Text(authScreenState.isLoginMode
                                ? "新規登録画面へ"
                                : "ログイン画面へ")),
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

  void _showLogindDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        // builder: (context) => const LoadingDialog(message: "処理中...")
        builder: (context) => ElevatedButton(onPressed: () {
          print(ref.read(authScreenProvider).isLoading);
        }, child: Text("Hoge"))
        ).then((value) {
          ref.read(authScreenProvider.notifier).setIsLoading(false);
        });
  }
}
