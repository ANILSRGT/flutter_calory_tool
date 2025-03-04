class RecipeNutritionModel {
  constructor({ calories, carbs, fat, protein }) {
    this.calories = calories;
    this.carbs = carbs;
    this.fat = fat;
    this.protein = protein;
  }

  static fromJson(json) {
    return new RecipeNutritionModel({
      calories: json["calories"],
      carbs: json["carbs"] ? parseFloat(json["carbs"]) : null,
      fat: json["fat"] ? parseFloat(json["fat"]) : null,
      protein: json["protein"] ? parseFloat(json["protein"]) : null,
    });
  }
}

export default RecipeNutritionModel;
