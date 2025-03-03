import 'package:calory_tool/data/models/food_allergen_model.dart';
import 'package:calory_tool/data/models/food_preference_model.dart';
import 'package:calory_tool/data/models/food_serving_model.dart';

class FoodModel {
  const FoodModel({
    required this.allergens,
    required this.preferences,
    required this.servings,
    this.id,
    this.name,
    this.type,
    this.subCategories,
    this.foodImage,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['food_id'] as String?,
      name: json['food_name'] as String?,
      type: json['food_type'] as String?,
      subCategories:
          (json['food_sub_categories'] as Map<String, dynamic>?) != null
              ? (json['food_sub_category'] as List?)
                  ?.map((e) => e as String)
                  .toList()
              : null,
      foodImage: json['foodImage'] as String?,
      allergens:
          (json['allergens'] as Map<String, dynamic>?) != null
              ? (json['allergen'] as List?)
                      ?.map(
                        (e) => FoodAllergenModel.fromJson(
                          e as Map<String, dynamic>,
                        ),
                      )
                      .toList() ??
                  []
              : [],
      preferences:
          (json['preferences'] as Map<String, dynamic>?) != null
              ? (json['preference'] as List?)
                      ?.map(
                        (e) => FoodPreferenceModel.fromJson(
                          e as Map<String, dynamic>,
                        ),
                      )
                      .toList() ??
                  []
              : [],
      servings:
          (json['servings'] as Map<String, dynamic>?) != null
              ? (json['serving'] as List?)
                      ?.map(
                        (e) => FoodServingModel.fromJson(
                          e as Map<String, dynamic>,
                        ),
                      )
                      .toList() ??
                  []
              : [],
    );
  }

  final String? id;
  final String? name;
  final String? type;
  final List<String>? subCategories;
  final String? foodImage;
  final List<FoodAllergenModel> allergens;
  final List<FoodPreferenceModel> preferences;
  final List<FoodServingModel> servings;
}
