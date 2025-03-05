class RecipeNutritionModel {
  const RecipeNutritionModel({
    this.calories,
    this.carbohydrates,
    this.fat,
    this.protein,
  });

  factory RecipeNutritionModel.fromJson(Map<String, dynamic> json) {
    return RecipeNutritionModel(
      calories: (json['calories'] as num?)?.toInt(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
    );
  }

  final int? calories;
  final double? carbohydrates;
  final double? fat;
  final double? protein;
}
