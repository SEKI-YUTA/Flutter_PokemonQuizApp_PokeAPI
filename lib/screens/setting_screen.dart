import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AspectRatio(
            aspectRatio: 1.56,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("これまで捕まえたポケモン XX匹"),
                    Text("登録した日 XXXX年XX月XX日")
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("/auth");
              },
              child: Text("ログアウト"))
        ],
      ),
    );
  }
}
