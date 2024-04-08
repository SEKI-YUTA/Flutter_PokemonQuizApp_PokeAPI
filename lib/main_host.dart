import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/screens/placeholder_screen.dart';
import 'package:pokemon_quiz_app/screens/pokemon_list_screen.dart';

class MainHost extends StatefulWidget {
  const MainHost({super.key});

  @override
  State<MainHost> createState() => _MainHostState();
}

class _MainHostState extends State<MainHost> {
  static const _screens = [
    PokemonListScreen(),
    // PlaceholderScreen(title: 'ポケモン図鑑'),
    PlaceholderScreen(title: 'ポケモンクイズ'),
  ];
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '図鑑'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'クイズ'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
