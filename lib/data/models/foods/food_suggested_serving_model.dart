class FoodSuggestedServingModel {
  const FoodSuggestedServingModel({
    this.servingId,
    this.servingDescription,
    this.metricServingDescription,
    this.metricMeasureAmount,
    this.numberOfUnits,
  });

  factory FoodSuggestedServingModel.fromJson(Map<String, dynamic> json) {
    return FoodSuggestedServingModel(
      servingId: json['serving_id'] as int?,
      servingDescription: json['serving_description'] as String?,
      metricServingDescription: json['metric_serving_description'] as String?,
      metricMeasureAmount: (json['metric_measure_amount'] as num?)?.toDouble(),
      numberOfUnits: (json['number_of_units'] as num?)?.toDouble(),
    );
  }

  final int? servingId;
  final String? servingDescription;
  final String? metricServingDescription;
  final double? metricMeasureAmount;
  final double? numberOfUnits;
}
