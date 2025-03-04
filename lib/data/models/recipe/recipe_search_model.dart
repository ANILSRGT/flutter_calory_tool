import 'package:calory_tool/data/models/recipe/recipe_model.dart';

class RecipeSearchModel {
  const RecipeSearchModel({this.pageNumber, this.recipeModel});

  factory RecipeSearchModel.fromJson(Map<String, dynamic> json) {
    final recipesJson = json['recipes'] as Map<String, dynamic>?;
    final recipeJson = recipesJson?['recipe'] as List<dynamic>?;
    final recipes =
        recipeJson
            ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    return RecipeSearchModel(
      pageNumber: recipesJson?['page_number'] as int?,
      recipeModel: recipes,
    );
  }

  final int? pageNumber;
  final List<RecipeModel>? recipeModel;
}
