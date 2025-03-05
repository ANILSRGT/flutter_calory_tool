import 'package:calory_tool/data/models/food/food_model.dart';

class FoodSearchModel {
  const FoodSearchModel({required this.pageNumber, required this.foods});

  factory FoodSearchModel.fromJson(Map<String, dynamic> json) {
    return FoodSearchModel(
      pageNumber: json['pageNumber'] as int?,
      foods:
          (json['foods'] as List?)
              ?.map((e) => FoodModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  final int? pageNumber;
  final List<FoodModel> foods;
}
