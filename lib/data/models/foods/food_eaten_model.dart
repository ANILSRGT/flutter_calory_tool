import 'package:calory_tool/data/models/foods/food_nutritional_content_model.dart';

class FoodEatenModel {
  const FoodEatenModel({
    this.singularDescription,
    this.pluralDescription,
    this.units,
    this.metricDescription,
    this.totalMetricAmount,
    this.perUnitMetricAmount,
    this.totalNutritionalContent,
  });

  factory FoodEatenModel.fromJson(Map<String, dynamic> json) {
    return FoodEatenModel(
      singularDescription: json['singular_description'] as String?,
      pluralDescription: json['plural_description'] as String?,
      units: (json['units'] as num?)?.toDouble(),
      metricDescription: json['metric_description'] as String?,
      totalMetricAmount: json['total_metric_amount'] as double?,
      perUnitMetricAmount: json['per_unit_metric_amount'] as double?,
      totalNutritionalContent:
          json['total_nutritional_content'] != null
              ? FoodNutritionalContentModel.fromJson(
                json['total_nutritional_content'] as Map<String, dynamic>,
              )
              : null,
    );
  }

  final String? singularDescription;
  final String? pluralDescription;
  final double? units;
  final String? metricDescription;
  final double? totalMetricAmount;
  final double? perUnitMetricAmount;
  final FoodNutritionalContentModel? totalNutritionalContent;
}
