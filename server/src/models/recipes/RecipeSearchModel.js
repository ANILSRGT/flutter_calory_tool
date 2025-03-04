import RecipeModel from "./RecipeModel";

class RecipeSearchModel {
  constructor({ pageNumber = null, recipeModel = null } = {}) {
    this.pageNumber = pageNumber;
    this.recipeModel = recipeModel;
  }

  static fromJson(json) {
    const recipesJson = json["recipes"];
    const recipeJson = recipesJson ? recipesJson["recipe"] : null;
    const recipes = recipeJson ? recipeJson.map(e => RecipeModel.fromJson(e)) : [];
    return new RecipeSearchModel({
      pageNumber: recipesJson ? recipesJson["page_number"] : null,
      recipes: recipes,
    });
  }
}

export default RecipeSearchModel;
