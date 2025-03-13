import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/data/models/recipes/recipe_model.dart';
import 'package:calory_tool/enum/favorite_category.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier{
  final List <RecipeModel> recipe =[];
  final List <FoodModel>  foods = [];

  void toogleFavoriteFood(FoodModel foodmodel){
    if(foods.any((e)=>e.id== foodmodel.id)){
      foods.removeWhere((e)=>e.id== foodmodel.id);
    }
    else {
      foods.add(foodmodel);
    }
      notifyListeners();
  }

  void toogleFavoriteRecipe(RecipeModel  recipeModel){
    if(recipe.any((e)=>e.id== recipeModel.id)){
      recipe.removeWhere((e)=>e.id== recipeModel.id);
    }
    else {
      recipe.add(recipeModel);
    }
    notifyListeners();
  }
}
