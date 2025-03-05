class FoodServingModel {
  const FoodServingModel({
    required this.id,
    required this.description,
    required this.url,
    required this.metricServingAmount,
    required this.metricServingUnit,
    required this.numberOfUnits,
    required this.measurementDescription,
    required this.calories,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
    required this.saturatedFat,
    required this.polyunsaturatedFat,
    required this.monounsaturatedFat,
    required this.cholesterol,
    required this.sodium,
    required this.potassium,
    required this.fiber,
    required this.sugar,
    required this.addedSugars,
    required this.vitaminA,
    required this.vitaminC,
    required this.vitaminD,
    required this.calcium,
    required this.iron,
  });

  factory FoodServingModel.fromJson(Map<String, dynamic> json) {
    return FoodServingModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      metricServingAmount: (json['metric_serving_amount'] as num?)?.toDouble(),
      metricServingUnit: json['metric_serving_unit'] as String?,
      numberOfUnits: (json['number_of_units'] as num?)?.toDouble(),
      measurementDescription: json['measurement_description'] as String?,
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
      addedSugars: (json['added_sugars'] as num?)?.toDouble(),
      vitaminA: (json['vitamin_a'] as num?)?.toDouble(),
      vitaminC: (json['vitamin_c'] as num?)?.toDouble(),
      vitaminD: (json['vitamin_d'] as num?)?.toDouble(),
      calcium: (json['calcium'] as num?)?.toDouble(),
      iron: (json['iron'] as num?)?.toDouble(),
    );
  }

  final String? id;
  final String? description;
  final String? url;
  final double? metricServingAmount;
  final String? metricServingUnit;
  final double? numberOfUnits;
  final String? measurementDescription;
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
  final double? addedSugars;
  final double? vitaminA;
  final double? vitaminC;
  final double? vitaminD;
  final double? calcium;
  final double? iron;
}
