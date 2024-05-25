import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/components/shimmer_user_information_card.dart';
import 'package:pokemon_quiz_app/components/user_information_card.dart';
import 'package:pokemon_quiz_app/data/FireStoreClient.dart';
import 'package:pokemon_quiz_app/data/model/UserData.dart';
import 'package:pokemon_quiz_app/provider/caught_pokemon_provider.dart';
import 'package:pokemon_quiz_app/provider/user_data_provider.dart';

class SettingScreen extends ConsumerStatefulWidget {
  // Bool _isLoading = false;
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userData = ref.watch(getUserDataProvider(FirebaseAuth.instance.currentUser!.uid));
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            userData.when(
              data: (data) => UserInformationCard(userData: data!),
              error: (error, stackTrace) => const Text('Error'),
              loading: () => const ShimmerUserInformationCard(),
              ),
            // userData != null
            //     ? UserInformationCard(userData: userData!)
            //     : const ShimmerUserInformationCard(),
            const SizedBox(height: 100),
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if(mounted) {
                    Navigator.of(context).pushReplacementNamed("/auth");
                  }
                },
                child: const Text("ログアウト"))
          ],
        ),
      ),
    );
  }
}
