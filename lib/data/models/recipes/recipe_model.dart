import 'package:calory_tool/data/models/recipes/recipe_nutrition_model.dart';

class RecipeModel {
  const RecipeModel({
    required this.ingredients,
    required this.types,
    this.id,
    this.name,
    this.description,
    this.image,
    this.nutrition,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      ingredients: List<String>.from(json['ingredients'] as List? ?? []),
      types: List<String>.from(json['types'] as List? ?? []),
      nutrition:
          json['nutrition'] != null
              ? RecipeNutritionModel.fromJson(
                json['nutrition'] as Map<String, dynamic>,
              )
              : null,
    );
  }

  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final List<String> ingredients;
  final List<String> types;
  final RecipeNutritionModel? nutrition;
}
