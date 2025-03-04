import 'package:calory_tool/data/models/food/food_model.dart';

class FoodSearchModel {
  const FoodSearchModel({required this.pageNumber, required this.foods});

  factory FoodSearchModel.fromJson(Map<String, dynamic> json) {
    final foodsJson = json['foods'] as Map<String, dynamic>?;
    final foodJson = foodsJson?['food'] as Map<String, dynamic>?;
    return FoodSearchModel(
      pageNumber: foodsJson?['page_number'] as int?,
      foods: foodJson == null ? [] : [FoodModel.fromJson(foodJson)],
    );
  }

  final int? pageNumber;
  final List<FoodModel> foods;
}
