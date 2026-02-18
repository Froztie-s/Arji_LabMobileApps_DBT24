import 'package:flutter/material.dart';
import 'screens/CategoryPage.dart';
import 'screens/FoodFilterPage.dart';
import 'screens/FoodListPage.dart';
import 'screens/FoodDetailPage.dart';
import 'screens/FoodFavoritesPage.dart';
import 'widgets/custombottomnavbar.dart';
import 'data/mockdata.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen()),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // Start on Food icon

  late final List<Widget> _pages = [
    const CategoryPage(), // Index 0
    const FoodFilterPage(), // Index 1
    const FoodListPage(), // Index 2
    const FoodFavoritesPage(), // Index 3
    FoodDetailPage(
      // Index 4 - preview with first mock recipe
      recipe: mockRecipes.first,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
