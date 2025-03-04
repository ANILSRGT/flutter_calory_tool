import 'package:calory_tool/data/models/recipe/recipe_nutrition_model.dart';

class RecipeModel {
  const RecipeModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.ingredients,
    this.types,
    this.nutrition,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['recipe_id'] as String?,
      name: json['recipe_name'] as String?,
      description: json['recipe_description'] as String?,
      image: json['recipe_image'] as String?,
      ingredients:
          ((json['recipe_ingredients'] as Map<String, dynamic>?)?['ingredient']
                  as List?)
              ?.map((e) => e as String)
              .toList(),
      types:
          ((json['recipe_types'] as Map<String, dynamic>?)?['recipe_type']
                  as List?)
              ?.map((e) => e as String)
              .toList(),
      nutrition:
          json['recipe_nutrition'] == null
              ? null
              : RecipeNutritionModel.fromJson(
                json['recipe_nutrition'] as Map<String, dynamic>,
              ),
    );
  }

  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final List<String>? ingredients;
  final List<String>? types;
  final RecipeNutritionModel? nutrition;
}
