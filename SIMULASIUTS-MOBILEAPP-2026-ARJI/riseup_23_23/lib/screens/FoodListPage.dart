import 'package:flutter/material.dart';
import '../data/mockdata.dart';
import '../models/recipes.dart';
import '../widgets/recipecard.dart';
import 'FoodFavoritesPage.dart';
import 'FoodFilterPage.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Pull directly from mockdata.dart
  List<Recipe> get _filteredRecipes {
    if (_searchQuery.isEmpty) return mockRecipes;
    return mockRecipes
        .where(
          (r) =>
              r.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              r.category.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F7),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Foods',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search recipes...',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // "Food Recipe" header with icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Food Recipe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    // Favorites icon
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodFavoritesPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.black87,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Filter icon
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodFilterPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.black87,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Recipe Grid
            Expanded(
              child: _filteredRecipes.isEmpty
                  ? const Center(
                      child: Text(
                        'No recipes found.',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    )
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.88,
                          ),
                      itemCount: _filteredRecipes.length,
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          recipe: _filteredRecipes[index],
                          onFavoriteChanged: () => setState(() {}),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
