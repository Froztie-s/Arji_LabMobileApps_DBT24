import 'package:flutter/material.dart';
import '../data/mockdata.dart';
import '../models/recipes.dart';
import '../widgets/recipecard.dart';

class FoodFavoritesPage extends StatefulWidget {
  const FoodFavoritesPage({super.key});

  @override
  State<FoodFavoritesPage> createState() => _FoodFavoritesPageState();
}

class _FoodFavoritesPageState extends State<FoodFavoritesPage> {
  List<Recipe> get _favoriteRecipes =>
      mockRecipes.where((r) => r.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F7),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
        ),
        title: const Text(
          'Favourite Foods',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: _favoriteRecipes.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No favourites yet!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap the heart on a recipe to save it here.',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.88,
                ),
                itemCount: _favoriteRecipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    key: ValueKey(_favoriteRecipes[index].title),
                    recipe: _favoriteRecipes[index],
                    onFavoriteChanged: () => setState(() {}),
                  );
                },
              ),
            ),
    );
  }
}
