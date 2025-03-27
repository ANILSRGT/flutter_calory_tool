import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/providers/food_provider.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/enum/planned_meals_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

class MealCard extends StatefulWidget {
  const MealCard({
    required this.meal,
    required this.imagePath,
    required this.plannedMeal,
    required this.foods,
    required this.date,
    this.onAddPressed,
    super.key,
  });

  final String meal;
  final PlannedMealsEnum plannedMeal;
  final String imagePath;
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
                      '${widget.meal}: ${widget.foods.map((e) => e.servings.isNotEmpty ? (e.servings.first.calories ?? 0) * e.amount : 0).fold<double>(0, (a, b) => a + b)} kcal',
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
                  child: Column(
                    children:
                        widget.foods.map((e) {
                          return Padding(
                            padding:
                                AppValues.sm.ext.padding.directional.bottom,
                            child: Slidable(
                              key: UniqueKey(),
                              enabled: sameDay,
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    label: 'Decrease',
                                    backgroundColor:
                                        context
                                            .appThemeExt
                                            .appColors
                                            .error
                                            .light,
                                    foregroundColor:
                                        context
                                            .appThemeExt
                                            .appColors
                                            .error
                                            .light
                                            .onColor,
                                    icon: Icons.remove,
                                    onPressed: (context) {
                                      if (e.id == null) return;

                                      context
                                          .read<FoodProvider>()
                                          .removeSevenDaysFood(
                                            e.id!,
                                            widget.plannedMeal,
                                            widget.date,
                                          );
                                    },
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Row(
                                  spacing: AppValues.sm.value,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          AppValues.xs.ext.radius.border.all,
                                      child: Image.network(
                                        e.imageUrl ?? '',
                                        width: 42,
                                        height: 42,
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Container(
                                            width: 42,
                                            height: 42,
                                            color:
                                                context
                                                    .appThemeExt
                                                    .appColors
                                                    .grey,
                                            child: Center(
                                              child: Icon(
                                                Icons.error,
                                                color:
                                                    context
                                                        .appThemeExt
                                                        .appColors
                                                        .lightGrey,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.name ?? '',
                                        style: context
                                            .ext
                                            .theme
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color:
                                                  context
                                                      .appThemeExt
                                                      .appColors
                                                      .white
                                                      .byBrightness(
                                                        context
                                                            .ext
                                                            .theme
                                                            .isDark,
                                                      )
                                                      .onColor,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '${e.servings.first.calories} x${e.amount} kcal',
                                      style: context
                                          .ext
                                          .theme
                                          .textTheme
                                          .bodyLarge
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
                                  ],
                                ),
                              ),
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
