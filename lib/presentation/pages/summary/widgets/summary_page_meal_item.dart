part of '../summary_page_imports.dart';

class _SummaryPageMealItem extends StatefulWidget {
  const _SummaryPageMealItem({
    required this.meal,
    required this.imagePath,
    required this.foods,
    required this.plannedMeal,
    required this.date,
  });

  final String meal;
  final String imagePath;
  final List<FoodModel> foods;
  final PlannedMealsEnum plannedMeal;
  final DateTime date;

  @override
  State<_SummaryPageMealItem> createState() => _SummaryPageMealItemState();
}

class _SummaryPageMealItemState extends State<_SummaryPageMealItem> {
  final bool _expandedMeals = false;

  @override
  Widget build(BuildContext context) {
    return MealCard(
      meal: widget.meal,
      imagePath: widget.imagePath,
      foods: widget.foods,
      plannedMeal: widget.plannedMeal,
      date: widget.date,
    );
  }
}
