import 'package:flutter/material.dart';
import '../models/recipes.dart';
import '../screens/FoodDetailPage.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final VoidCallback? onFavoriteChanged;

  const RecipeCard({super.key, required this.recipe, this.onFavoriteChanged});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
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
    widget.onFavoriteChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailPage(recipe: widget.recipe),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Inner image card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: widget.recipe.imageUrl.startsWith('http')
                      ? Image.network(
                          widget.recipe.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _imagePlaceholder(),
                        )
                      : Image.asset(
                          widget.recipe.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _imagePlaceholder(),
                        ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Title + heart + tag on one row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.recipe.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: _toggleFavorite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 15,
                      color: _isFavorite ? Colors.red : Colors.black54,
                    ),
                  ),
                ),
                Text(
                  widget.recipe.category,
                  style: TextStyle(
                    fontSize: 11,
                    color: widget.recipe.isVegan
                        ? const Color(0xFF4CAF50)
                        : const Color(0xFFE53935),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // Nutrition info
            Text(
              '${widget.recipe.calories} Calories | '
              '${widget.recipe.protein} Gr Protein | '
              '${widget.recipe.fat} Gr Fat',
              style: const TextStyle(fontSize: 9.5, color: Colors.black54),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      color: const Color(0xFFE0E0E0),
      child: const Center(
        child: Icon(Icons.restaurant, color: Colors.white54, size: 36),
      ),
    );
  }
}
