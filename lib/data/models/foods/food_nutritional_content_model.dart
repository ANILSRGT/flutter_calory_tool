class FoodNutritionalContentModel {
  FoodNutritionalContentModel({
    this.calories,
    this.carbohydrate,
    this.protein,
    this.fat,
    this.saturatedFat,
    this.polyunsaturatedFat,
    this.monounsaturatedFat,
    this.cholesterol,
    this.sodium,
    this.potassium,
    this.fiber,
    this.sugar,
    this.vitaminA,
    this.vitaminC,
    this.calcium,
    this.iron,
  });

  factory FoodNutritionalContentModel.fromJson(Map<String, dynamic> json) {
    return FoodNutritionalContentModel(
      calories: (json['calories'] as num?)?.toDouble(),
      carbohydrate: (json['carbohydrate'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      saturatedFat: (json['saturated_fat'] as num?)?.toDouble(),
      polyunsaturatedFat: (json['polyunsaturated_fat'] as num?)?.toDouble(),
      monounsaturatedFat: (json['monounsaturated_fat'] as num?)?.toDouble(),
      cholesterol: (json['cholesterol'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      potassium: (json['potassium'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
      sugar: (json['sugar'] as num?)?.toDouble(),
      vitaminA: (json['vitamin_a'] as num?)?.toDouble(),
      vitaminC: (json['vitamin_c'] as num?)?.toDouble(),
      calcium: (json['calcium'] as num?)?.toDouble(),
      iron: (json['iron'] as num?)?.toDouble(),
    );
  }

  final double? calories;
  final double? carbohydrate;
  final double? protein;
  final double? fat;
  final double? saturatedFat;
  final double? polyunsaturatedFat;
  final double? monounsaturatedFat;
  final double? cholesterol;
  final double? sodium;
  final double? potassium;
  final double? fiber;
  final double? sugar;
  final double? vitaminA;
  final double? vitaminC;
  final double? calcium;
  final double? iron;
}
