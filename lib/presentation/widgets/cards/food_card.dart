import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/providers/favorite_provider.dart';
import 'package:calory_tool/core/router/app_router.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({required this.foodModel, super.key});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    final theme = context.ext.theme;
    final colors = context.appThemeExt.appColors;
    final isFavorite = context.watch<FavoritesProvider>().foods.any((e) => e.id == foodModel.id);

    return GestureDetector(
      onTap: () {
        context.router.push(FoodDetailRoute(foodModel: foodModel));
      },
      child: Card(
        color: theme.isDark ? Colors.grey[900] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  foodModel.imageUrl ?? '',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 80, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  foodModel.name ?? 'Unknown Food',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: theme.isDark ? Colors.white : Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<FavoritesProvider>().toogleFavoriteFood(foodModel);
                },
                icon: CircleAvatar(

                  backgroundColor: Colors.grey.withValues(alpha: 0.3),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
