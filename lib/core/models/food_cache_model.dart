import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/enum/planned_meals_enum.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'food_cache_model.g.dart';

@HiveType(typeId: 14)
class FoodCacheModel extends HiveObject {
  FoodCacheModel({required this.date, required this.foodEntries});

  factory FoodCacheModel.empty(DateTime date) {
    return FoodCacheModel(
      date: date,
      foodEntries: {for (final meal in PlannedMealsEnum.values) meal: []},
    );
  }

  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  Map<PlannedMealsEnum, List<FoodModel>> foodEntries;

  void addFood(FoodModel food, PlannedMealsEnum type) {
    foodEntries[type] ??= [];
    foodEntries[type]!.add(food);
  }

  void removeFood(String? id, PlannedMealsEnum type) {
    foodEntries[type]?.removeWhere((element) => element.id == id);
  }

  bool containsFood(String? foodId, PlannedMealsEnum type) {
    return foodEntries[type]?.any((element) => element.id == foodId) ?? false;
  }
}
