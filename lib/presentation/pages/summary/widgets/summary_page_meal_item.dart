part of '../summary_page_imports.dart';

class _SummaryPageMealItem extends StatefulWidget {
  const _SummaryPageMealItem({
    required this.meal,
    required this.imagePath,
    required this.foods,
  });

  final String meal;
  final String imagePath;
  final List<FoodModel> foods;

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
    );
  }
}
