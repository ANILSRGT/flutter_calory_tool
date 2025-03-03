import 'package:calory_tool/data/models/food_model.dart';

class FoodSearchModel {
  const FoodSearchModel({required this.pageNumber, required this.foods});

  factory FoodSearchModel.fromJson(Map<String, dynamic> json) {
    final foodsJson = json['food'] as List?;
    final foods =
        foodsJson
            ?.map((e) => FoodModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    return FoodSearchModel(
      pageNumber: json['pageNumber'] as int?,
      foods: foods,
    );
  }

  final int? pageNumber;
  final List<FoodModel> foods;
}
