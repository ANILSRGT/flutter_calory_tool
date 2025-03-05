class RecipeNutritionModel {
  constructor({ calories, carbohydrate, fat, protein }) {
    this.calories = calories;
    this.carbohydrate = carbohydrate;
    this.fat = fat;
    this.protein = protein;
  }

  static fromJson(json) {
    return new RecipeNutritionModel({
      calories: json["calories"] ? parseInt(json["calories"]) : null,
      carbohydrate: json["carbohydrate"] ? parseFloat(json["carbohydrate"]) : null,
      fat: json["fat"] ? parseFloat(json["fat"]) : null,
      protein: json["protein"] ? parseFloat(json["protein"]) : null,
    });
  }
}

export default RecipeNutritionModel;
