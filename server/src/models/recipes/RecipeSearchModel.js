import RecipeModel from "./RecipeModel.js";

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
      pageNumber: recipesJson?.["page_number"] ? parseInt(recipesJson["page_number"]) : null,
      recipes: recipes,
    });
  }
}

export default RecipeSearchModel;
