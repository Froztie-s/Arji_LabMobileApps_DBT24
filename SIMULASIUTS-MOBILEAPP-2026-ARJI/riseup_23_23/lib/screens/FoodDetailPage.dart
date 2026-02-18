// lib/screens/FoodDetailPage.dart

import 'package:flutter/material.dart';
import '../models/recipes.dart';

class FoodDetailPage extends StatefulWidget {
  final Recipe recipe;

  const FoodDetailPage({super.key, required this.recipe});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.recipe.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      widget.recipe.isFavorite = _isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),

              // Rounded image with favorite button overlay
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    // Image with rounded corners
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 260,
                        child: recipe.imageUrl.startsWith('http')
                            ? Image.network(
                                recipe.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => _placeholder(),
                              )
                            : Image.asset(
                                recipe.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => _placeholder(),
                              ),
                      ),
                    ),

                    // Favorite button (top right of image)
                    Positioned(
                      top: 14,
                      right: 14,
                      child: GestureDetector(
                        onTap: _toggleFavorite,
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDFF2EB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite
                                ? Colors.red
                                : const Color(0xFF4CAF50),
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + category + info icon
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          recipe.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '·',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          recipe.category,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4CAF50),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.info_outline,
                            size: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Tags
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ...recipe.tags.map((tag) => _tagChip(tag)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 13,
                                color: Colors.grey.shade500,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                recipe.cookTime,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Nutrition card
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFF2EB),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Nutrition',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                '  -  ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              const Icon(
                                Icons.local_fire_department,
                                size: 16,
                                color: Colors.black54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${recipe.calories} calr',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '|',
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.water_drop_outlined,
                                size: 16,
                                color: Colors.black54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                recipe.omega,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            recipe.description,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Ingredients header
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Ingredients list
                    recipe.ingredientList.isEmpty
                        ? const Text(
                            'No ingredients listed.',
                            style: TextStyle(color: Colors.grey),
                          )
                        : Column(
                            children: recipe.ingredientList
                                .map((i) => _ingredientRow(i))
                                .toList(),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tagChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
      ),
    );
  }

  Widget _ingredientRow(Ingredient ingredient) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 60,
              height: 60,
              child: ingredient.imageUrl.startsWith('http')
                  ? Image.network(
                      ingredient.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _ingredientPlaceholder(),
                    )
                  : _ingredientPlaceholder(),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              ingredient.name,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            ingredient.amount,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: const Color(0xFFE0E0E0),
      child: const Center(
        child: Icon(Icons.restaurant, color: Colors.white54, size: 48),
      ),
    );
  }

  Widget _ingredientPlaceholder() {
    return Container(
      color: const Color(0xFFF0F0F0),
      child: const Center(
        child: Icon(Icons.food_bank, color: Colors.grey, size: 28),
      ),
    );
  }
}
