import 'package:calory_tool/data/models/recipes/recipe_model.dart';

class RecipeSearchModel {
  const RecipeSearchModel({required this.recipes, this.pageNumber});

  factory RecipeSearchModel.fromJson(Map<String, dynamic> json) {
    return RecipeSearchModel(
      pageNumber: (json['page_number'] as num?)?.toInt(),
      recipes:
          (json['recipes'] as List?)
              ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  final int? pageNumber;
  final List<RecipeModel> recipes;
}
