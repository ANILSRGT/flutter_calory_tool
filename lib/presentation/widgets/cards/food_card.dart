import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/router/app_router.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({required this.foodModel, super.key});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    final theme = context.ext.theme;
    final colors = context.appThemeExt.appColors;
    final textColor = colors.white.byBrightness(theme.isDark).onColor;

    return GestureDetector(
      onTap: () {
        context.router.push(FoodDetailRoute(foodModel: foodModel));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(foodModel.imageUrl ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white70,
                        Colors.grey.shade600.withValues(alpha: 0.4),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  foodModel.name ?? 'Unknown Food',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
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
