import 'package:calory_tool/data/models/foods/food_model.dart';

class FoodSearchModel {
  const FoodSearchModel({required this.foods, this.pageNumber});

  factory FoodSearchModel.fromJson(Map<String, dynamic> json) {
    final foods = json['foods'] as List? ?? [];
    return FoodSearchModel(
      pageNumber: (json['page_number'] as num?)?.toInt(),
      foods:
          foods
              .map((dynamic e) => FoodModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  final int? pageNumber;
  final List<FoodModel> foods;
}
