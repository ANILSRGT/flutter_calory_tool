import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/providers/food_provider.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/enum/planned_meals_enum.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

class MealCard extends StatefulWidget {
  const MealCard({
    required this.plannedMeal,
    required this.foods,
    required this.date,
    this.onAddPressed,
    super.key,
  });

  final PlannedMealsEnum plannedMeal;
  final List<FoodModel> foods;
  final DateTime date;
  final VoidCallback? onAddPressed;

  @override
  State<MealCard> createState() => MealCardState();
}

class MealCardState extends State<MealCard> {
  bool _expandedMeals = false;

  @override
  Widget build(BuildContext context) {
    final sameDay = widget.date.toUtc().ext.compare.isSameDay(
      DateTime.now().toUtc(),
    );
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
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
                      widget.plannedMeal.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      '${widget.plannedMeal.displayName}: ${widget.foods.map((e) => e.servings.isNotEmpty ? (e.servings.first.calories ?? 0) * e.amount : 0).fold<double>(0, (a, b) => a + b)} kcal',
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
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children:
                            widget.foods.map((e) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 15,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: AppValues.sm.value,
                                  children: [
                                    Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.name ?? '',
                                          style:TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text(
                                              'C: ${e.servings.first.carbohydrate ?? ''}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 11,),
                                            Text(
                                              'P: ${e.servings.first.protein ?? ''}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 11,),
                                            Text(
                                              'F: ${e.servings.first.fat ?? ''}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 11,),
                                            Text(
                                              'Cal:  ${widget.foods.map((e) => e.servings.isNotEmpty ? (e.servings.first.calories ?? 0) * e.amount : 0).fold<double>(0, (a, b) => a + b)} kcal',
                                              style: TextStyle(
                                                fontSize: 15,

                                                color: Colors.grey,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),

                                          ],
                                        ),


                                      ],
                                    ),
                                    SizedBox(width: 15,),
                                    IconButton(
                                      icon: Icon(Icons.dangerous_outlined, color: Colors.grey,size: 25,),
                                      onPressed: () {
                                        if (e.id == null) return;
                                        context.read<FoodProvider>().removeSevenDaysFood(
                                          e.id!,
                                          widget.plannedMeal,
                                          widget.date,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
