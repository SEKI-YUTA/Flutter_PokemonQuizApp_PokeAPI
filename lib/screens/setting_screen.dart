import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_quiz_app/components/user_information_card.dart';
import 'package:pokemon_quiz_app/data/FireStoreClient.dart';
import 'package:pokemon_quiz_app/data/model/UserData.dart';

class SettingScreen extends StatefulWidget {
  // Bool _isLoading = false;
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  UserData? userData;
  bool _isLoading = false;

  Future<void> _getUserData() async {
    setState(() {
      _isLoading = true;
    });
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userData = await FireStoreClient.getUserData(user.uid);
      setState(() {
        this.userData = userData;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          userData != null
              ? UserInformationCard(userData: userData!)
              : Container(),
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
