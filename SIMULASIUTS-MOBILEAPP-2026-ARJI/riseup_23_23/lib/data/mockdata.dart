// lib/data/mockdata.dart

import '../models/recipes.dart';

final List<Recipe> mockRecipes = [
  Recipe(
    title: 'Maple Salmon',
    imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
    calories: '250',
    protein: '40',
    fat: '2',
    isVegan: false,
    isFavorite: false,
    cookTime: '20 Minutes',
    omega: 'omega-3 fatty',
    description:
        'Maple Salmon is a delicious dish featuring salmon fillets glazed with a sweet and savory maple syrup sauce. It\'s a popular recipe known for its rich flavor and health benefits.',
    tags: ['Seafood', 'Dinner', 'Gluten Free', 'High Protein', 'Quick'],
    ingredientList: [
      Ingredient(
        name: 'Salmon fillet',
        amount: '200g',
        imageUrl:
            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
      ),
      Ingredient(
        name: 'Maple syrup',
        amount: '2 tbsp',
        imageUrl: 'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62',
      ),
      Ingredient(
        name: 'Garlic',
        amount: '2 cloves',
        imageUrl:
            'https://images.unsplash.com/photo-1540148426945-6cf22a6b2383',
      ),
      Ingredient(
        name: 'Lemon juice',
        amount: '1 tbsp',
        imageUrl:
            'https://images.unsplash.com/photo-1587486913049-53fc88980cfc',
      ),
      Ingredient(
        name: 'Soy sauce',
        amount: '1 tbsp',
        imageUrl: 'https://images.unsplash.com/photo-1563636619-e9143da7973b',
      ),
    ],
  ),
  Recipe(
    title: 'Lentil Soup',
    imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd',
    calories: '200',
    protein: '14',
    fat: '3',
    isVegan: true,
    isFavorite: false,
    cookTime: '10 Minutes',
    omega: 'omega-3 fatty',
    description:
        'Lentil soup is a hearty soup made with lentils, vegetables, and stock. It\'s a staple food in many parts of the world, including Europe, Latin America, and the Middle East.',
    tags: [
      'Dairy',
      'Breakfast',
      'Gluten Free',
      'Fruit-Based',
      'Quick',
      'Sugar Free',
      'Easy',
    ],
    ingredientList: [
      Ingredient(
        name: 'Lentils',
        amount: '100g',
        imageUrl:
            'https://images.unsplash.com/photo-1585485050547-040e4e7b6c3e',
      ),
      Ingredient(
        name: 'Veggies',
        amount: '50g',
        imageUrl:
            'https://images.unsplash.com/photo-1540420773420-3366772f4999',
      ),
      Ingredient(
        name: 'Vegetable broth',
        amount: '500ml',
        imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd',
      ),
      Ingredient(
        name: 'Cumin',
        amount: '1 tsp',
        imageUrl:
            'https://images.unsplash.com/photo-1596040033229-a9821ebd058d',
      ),
      Ingredient(
        name: 'Olive oil',
        amount: '1 tbsp',
        imageUrl:
            'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5',
      ),
    ],
  ),
  Recipe(
    title: 'Yogurt Bowl',
    imageUrl: 'https://images.unsplash.com/photo-1488477181946-6428a0291777',
    calories: '150',
    protein: '10',
    fat: '4',
    isVegan: true,
    isFavorite: false,
    cookTime: '5 Minutes',
    omega: 'omega-6 fatty',
    description:
        'A refreshing yogurt bowl topped with fresh berries, granola, and a drizzle of honey. Perfect for a quick and healthy breakfast or snack.',
    tags: ['Breakfast', 'Vegan', 'Quick', 'Sugar Free', 'Easy', 'Fruit-Based'],
    ingredientList: [
      Ingredient(
        name: 'Greek yogurt',
        amount: '200g',
        imageUrl:
            'https://images.unsplash.com/photo-1488477181946-6428a0291777',
      ),
      Ingredient(
        name: 'Blueberries',
        amount: '50g',
        imageUrl:
            'https://images.unsplash.com/photo-1498557850523-fd3d118b962e',
      ),
      Ingredient(
        name: 'Strawberries',
        amount: '50g',
        imageUrl:
            'https://images.unsplash.com/photo-1464965911861-746a04b4bca6',
      ),
      Ingredient(
        name: 'Honey',
        amount: '1 tbsp',
        imageUrl: 'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62',
      ),
      Ingredient(
        name: 'Granola',
        amount: '30g',
        imageUrl:
            'https://images.unsplash.com/photo-1517686469429-8bdb88b9f907',
      ),
    ],
  ),
  Recipe(
    title: 'Smoothies',
    imageUrl: 'https://images.unsplash.com/photo-1553530666-ba11a7da3888',
    calories: '180',
    protein: '5',
    fat: '2',
    isVegan: true,
    isFavorite: false,
    cookTime: '5 Minutes',
    omega: 'omega-6 fatty',
    description:
        'A vibrant mixed berry smoothie blended with banana and almond milk. Packed with antioxidants and natural energy to kickstart your day.',
    tags: ['Breakfast', 'Vegan', 'Quick', 'Fruit-Based', 'Gluten Free'],
    ingredientList: [
      Ingredient(
        name: 'Mixed berries',
        amount: '100g',
        imageUrl: 'https://images.unsplash.com/photo-1553530666-ba11a7da3888',
      ),
      Ingredient(
        name: 'Banana',
        amount: '1 piece',
        imageUrl:
            'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e',
      ),
      Ingredient(
        name: 'Almond milk',
        amount: '250ml',
        imageUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150',
      ),
      Ingredient(
        name: 'Chia seeds',
        amount: '1 tbsp',
        imageUrl:
            'https://images.unsplash.com/photo-1514733670139-4d660d drivers',
      ),
      Ingredient(
        name: 'Honey',
        amount: '1 tsp',
        imageUrl: 'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62',
      ),
    ],
  ),
  Recipe(
    title: 'Caesar Salad',
    imageUrl: 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9',
    calories: '240',
    protein: '12',
    fat: '18',
    isVegan: false,
    isFavorite: false,
    cookTime: '15 Minutes',
    omega: 'omega-9 fatty',
    description:
        'A classic Caesar salad with crispy romaine lettuce, crunchy croutons, and shaved parmesan, all tossed in a rich and tangy Caesar dressing.',
    tags: ['Lunch', 'Quick', 'Easy', 'High Protein', 'Gluten Free'],
    ingredientList: [
      Ingredient(
        name: 'Romaine lettuce',
        amount: '150g',
        imageUrl: 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9',
      ),
      Ingredient(
        name: 'Croutons',
        amount: '30g',
        imageUrl:
            'https://images.unsplash.com/photo-1509440159596-0249088772ff',
      ),
      Ingredient(
        name: 'Parmesan',
        amount: '20g',
        imageUrl:
            'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d',
      ),
      Ingredient(
        name: 'Caesar dressing',
        amount: '2 tbsp',
        imageUrl:
            'https://images.unsplash.com/photo-1540420773420-3366772f4999',
      ),
    ],
  ),
  Recipe(
    title: 'English Breakfast',
    imageUrl: 'https://images.unsplash.com/photo-1533920379810-6bedac9e73b8',
    calories: '520',
    protein: '30',
    fat: '35',
    isVegan: false,
    isFavorite: false,
    cookTime: '25 Minutes',
    omega: 'omega-6 fatty',
    description:
        'A traditional full English breakfast with eggs, bacon, sausages, baked beans, grilled tomatoes, and toast. The ultimate hearty morning meal.',
    tags: ['Breakfast', 'High Protein', 'Quick', 'Easy'],
    ingredientList: [
      Ingredient(
        name: 'Eggs',
        amount: '2 pieces',
        imageUrl:
            'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f',
      ),
      Ingredient(
        name: 'Bacon',
        amount: '3 strips',
        imageUrl:
            'https://images.unsplash.com/photo-1528607929212-2636ec44253e',
      ),
      Ingredient(
        name: 'Sausages',
        amount: '2 pieces',
        imageUrl:
            'https://images.unsplash.com/photo-1533920379810-6bedac9e73b8',
      ),
      Ingredient(
        name: 'Baked beans',
        amount: '100g',
        imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd',
      ),
      Ingredient(
        name: 'Toast',
        amount: '2 slices',
        imageUrl:
            'https://images.unsplash.com/photo-1509440159596-0249088772ff',
      ),
    ],
  ),
];
