import 'package:calory_tool/data/models/recipe/recipe_model.dart';

class RecipeSearchModel {
  const RecipeSearchModel({this.pageNumber, this.recipes});

  factory RecipeSearchModel.fromJson(Map<String, dynamic> json) {
    return RecipeSearchModel(
      pageNumber: json['page_number'] as int?,
      recipes:
          (json['recipes'] as List<dynamic>?)
              ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  final int? pageNumber;
  final List<RecipeModel>? recipes;
}
