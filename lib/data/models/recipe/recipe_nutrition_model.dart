class RecipeNutritionModel{
  const RecipeNutritionModel({
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
  });

  factory RecipeNutritionModel.fromJson(Map<String, dynamic> json) {
    return RecipeNutritionModel(
      calories: json['calories'] as int?,
      carbs: (json['carbs'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
    );
  }
  
  final int? calories;
  final double? carbs;
  final double? fat;
  final double? protein;
}