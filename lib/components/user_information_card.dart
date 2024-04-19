import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/data/model/UserData.dart';

class UserInformationCard extends StatelessWidget {
  final UserData userData;
  const UserInformationCard({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.56,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "これまで捕まえたポケモン",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "${userData.caughtPokemonCount}匹",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "登録した日",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                userData.createdAt,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
