import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/firebase_options.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> initApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (mounted) {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.of(context).pushReplacementNamed('/mainHost')
          : Navigator.of(context).pushReplacementNamed('/auth');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Text("Splash Screen"),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/auth');
          },
          child: const Text("navigate to auth screen"))
    ]));
  }
}
