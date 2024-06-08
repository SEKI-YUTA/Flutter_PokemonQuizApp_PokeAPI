import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_quiz_app/provider/network_state_provider.dart';
import 'package:pokemon_quiz_app/screens/box_screen.dart';
import 'package:pokemon_quiz_app/screens/pokemon_list_screen.dart';
import 'package:pokemon_quiz_app/screens/pokemon_quiz_screen.dart';
import 'package:pokemon_quiz_app/screens/setting_screen.dart';

class MainHost extends ConsumerStatefulWidget {
  const MainHost({super.key});

  @override
  ConsumerState<MainHost> createState() => _MainHostState();
}

class _MainHostState extends ConsumerState<MainHost> {
  static const _screens = [
    PokemonListScreen(),
    PokemonQuizScreen(),
    BoxScreen(),
    SettingScreen()
  ];
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var networkState = ref.watch(networkConnectivityProvider);
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(child: _screens[_selectedIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onTabTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.book), label: '図鑑'),
              BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'クイズ'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket), label: 'ボックス'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
        networkState.valueOrNull != null &&
                (networkState.value! != ConnectivityResult.mobile &&
                    networkState.value! != ConnectivityResult.wifi &&
                    networkState.value! != ConnectivityResult.ethernet &&
                    networkState.value! != ConnectivityResult.vpn)
            ? Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "インターネット接続がありません。",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "インターネットに接続してください。\n Android: クイック設定 -> WiFi\n iOS: コントロールセンター -> WiFi",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
