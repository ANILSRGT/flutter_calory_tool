import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class MealCard extends StatefulWidget {
  const MealCard({
    required this.meal,
    required this.imagePath,
    required this.foods,
    this.onAddPressed,
    super.key,
  });

  final String meal;
  final String imagePath;
  final List<FoodModel> foods;
  final VoidCallback? onAddPressed;

  @override
  State<MealCard> createState() => MealCardState();
}

class MealCardState extends State<MealCard> {
  bool _expandedMeals = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: context.appThemeExt.appColors.white.byBrightness(
            context.ext.theme.isDark,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _expandedMeals = !_expandedMeals;
                });
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      '${widget.meal}: ${widget.foods.map((e) => e.servings.isNotEmpty ? e.servings.first.calories : 0).fold<int>(0, (a, b) => a + (b ?? 0).toInt())} kcal',
                      style: context.ext.theme.textTheme.titleMedium?.copyWith(
                        color:
                            context.appThemeExt.appColors.white
                                .byBrightness(context.ext.theme.isDark)
                                .onColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    _expandedMeals ? Icons.arrow_upward : Icons.arrow_downward,
                  ),
                  AppValues.md.ext.sizedBox.horizontal,
                  if (widget.onAddPressed != null)
                    GestureDetector(
                      onTap: widget.onAddPressed,
                      child: CircleAvatar(
                        backgroundColor: context.appThemeExt.appColors.primary,
                        foregroundColor:
                            context.appThemeExt.appColors.primary.onColor,
                        child: const Icon(Icons.add),
                      ),
                    ),
                ],
              ),
            ),
            if (_expandedMeals)
              Padding(
                padding: AppValues.sm.ext.padding.directional.top,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children:
                        widget.foods.map((e) {
                          return Padding(
                            padding:
                                AppValues.sm.ext.padding.directional.bottom,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.name ?? '',
                                    style: context.ext.theme.textTheme.bodyLarge
                                        ?.copyWith(
                                          color:
                                              context
                                                  .appThemeExt
                                                  .appColors
                                                  .white
                                                  .byBrightness(
                                                    context.ext.theme.isDark,
                                                  )
                                                  .onColor,
                                        ),
                                  ),
                                ),
                                Text(
                                  '${e.servings.map((e) => e.calories ?? 0)} kcal',
                                  style: context.ext.theme.textTheme.bodyLarge
                                      ?.copyWith(
                                        color:
                                            context.appThemeExt.appColors.white
                                                .byBrightness(
                                                  context.ext.theme.isDark,
                                                )
                                                .onColor,
                                      ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
