import 'package:calory_tool/data/models/foods/food_eaten_model.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/data/models/foods/food_suggested_serving_model.dart';

class FoodImageRecognitionModel {
  FoodImageRecognitionModel({
    this.foodId,
    this.foodName,
    this.eaten,
    this.suggestedServing,
    this.food,
  });

  factory FoodImageRecognitionModel.fromJson(Map<String, dynamic> data) {
    return FoodImageRecognitionModel(
      foodId: data['food_id'] as int?,
      foodName: data['food_entry_name'] as String?,
      eaten:
          data['eaten'] != null
              ? FoodEatenModel.fromJson(data['eaten'] as Map<String, dynamic>)
              : null,
      suggestedServing:
          data['suggested_serving'] != null
              ? FoodSuggestedServingModel.fromJson(
                data['suggested_serving'] as Map<String, dynamic>,
              )
              : null,
      food:
          data['food'] != null
              ? FoodModel.fromJson(data['food'] as Map<String, dynamic>)
              : null,
    );
  }

  final int? foodId;
  final String? foodName;
  final FoodEatenModel? eaten;
  final FoodSuggestedServingModel? suggestedServing;
  final FoodModel? food;
}
