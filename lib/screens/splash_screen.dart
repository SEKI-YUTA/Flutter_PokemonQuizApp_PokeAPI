import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
