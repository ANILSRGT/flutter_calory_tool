class FoodServingModel {
  const FoodServingModel({
    this.servingId,
    this.servingDescription,
    this.servingUrl,
    this.metricServingAmount,
    this.metricServingUnit,
    this.numberOfUnits,
    this.measurementDescription,
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

  factory FoodServingModel.fromJson(Map<String, dynamic> json) {
    return FoodServingModel(
      servingId: json['serving_id'] as String?,
      servingDescription: json['serving_description'] as String?,
      servingUrl: json['serving_url'] as String?,
      metricServingAmount:
          json['metric_serving_amount'] != null
              ? double.tryParse(json['metric_serving_amount'] as String)
              : null,
      metricServingUnit: json['metric_serving_unit'] as String?,
      numberOfUnits:
          json['number_of_units'] != null
              ? double.tryParse(json['number_of_units'] as String)
              : null,
      measurementDescription: json['measurement_description'] as String?,
      calories:
          json['calories'] != null
              ? int.tryParse(json['calories'] as String)
              : null,
      carbohydrate:
          json['carbohydrate'] != null
              ? double.tryParse(json['carbohydrate'] as String)
              : null,
      protein:
          json['protein'] != null
              ? double.tryParse(json['protein'] as String)
              : null,
      fat: json['fat'] != null ? double.tryParse(json['fat'] as String) : null,
      saturatedFat:
          json['saturated_fat'] != null
              ? double.tryParse(json['saturated_fat'] as String)
              : null,
      polyunsaturatedFat:
          json['polyunsaturated_fat'] != null
              ? double.tryParse(json['polyunsaturated_fat'] as String)
              : null,
      monounsaturatedFat:
          json['monounsaturated_fat'] != null
              ? double.tryParse(json['monounsaturated_fat'] as String)
              : null,
      cholesterol:
          json['cholesterol'] != null
              ? double.tryParse(json['cholesterol'] as String)
              : null,
      sodium:
          json['sodium'] != null
              ? double.tryParse(json['sodium'] as String)
              : null,
      potassium:
          json['potassium'] != null
              ? double.tryParse(json['potassium'] as String)
              : null,
      fiber:
          json['fiber'] != null
              ? double.tryParse(json['fiber'] as String)
              : null,
      sugar:
          json['sugar'] != null
              ? double.tryParse(json['sugar'] as String)
              : null,
      vitaminA:
          json['vitamin_a'] != null
              ? double.tryParse(json['vitamin_a'] as String)
              : null,
      vitaminC:
          json['vitamin_c'] != null
              ? double.tryParse(json['vitamin_c'] as String)
              : null,
      calcium:
          json['calcium'] != null
              ? double.tryParse(json['calcium'] as String)
              : null,
      iron:
          json['iron'] != null ? double.tryParse(json['iron'] as String) : null,
    );
  }

  final String? servingId;
  final String? servingDescription;
  final String? servingUrl;
  final double? metricServingAmount;
  final String? metricServingUnit;
  final double? numberOfUnits;
  final String? measurementDescription;
  final int? calories;
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
