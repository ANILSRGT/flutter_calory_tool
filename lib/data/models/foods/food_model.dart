import 'package:calory_tool/data/models/foods/food_allergen_model.dart';
import 'package:calory_tool/data/models/foods/food_preference_model.dart';
import 'package:calory_tool/data/models/foods/food_serving_model.dart';

class FoodModel {
  const FoodModel({
    required this.subCategories,
    required this.allergens,
    required this.preferences,
    required this.servings,
    this.id,
    this.name,
    this.brandName,
    this.type,
    this.url,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    final subCategories = json['sub_categories'] as List? ?? [];
    final allergens = json['allergens'] as List? ?? [];
    final preferences = json['preferences'] as List? ?? [];
    final servings = json['servings'] as List? ?? [];

    return FoodModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      brandName: json['brand_name'] as String?,
      type: json['type'] as String?,
      subCategories: subCategories.map((e) => e as String).toList(),
      url: json['url'] as String?,
      allergens:
          allergens
              .map((e) => FoodAllergenModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      preferences:
          preferences
              .map(
                (e) => FoodPreferenceModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      servings:
          servings
              .map((e) => FoodServingModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  final String? id;
  final String? name;
  final String? brandName;
  final String? type;
  final List<String> subCategories;
  final String? url;
  final List<FoodAllergenModel> allergens;
  final List<FoodPreferenceModel> preferences;
  final List<FoodServingModel> servings;
}
