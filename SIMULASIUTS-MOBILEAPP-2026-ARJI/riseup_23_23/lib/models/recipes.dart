// lib/models/recipes.dart

class Ingredient {
  final String name;
  final String amount;
  final String imageUrl;

  const Ingredient({
    required this.name,
    required this.amount,
    this.imageUrl = '',
  });
}

class Recipe {
  final String title;
  final String imageUrl;
  final String calories;
  final String protein;
  final String fat;
  final bool isVegan;
  final List<String> tags;
  final String description;
  final String cookTime;
  final String omega;
  final List<Ingredient> ingredientList;
  bool isFavorite;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.calories,
    this.protein = '0',
    this.fat = '0',
    this.isVegan = false,
    this.tags = const [],
    this.description = '',
    this.cookTime = '10 Minutes',
    this.omega = 'omega-3 fatty',
    this.ingredientList = const [],
    this.isFavorite = false,
  });

  String get category => isVegan ? 'Vegan' : 'Non-Vegan';
}
