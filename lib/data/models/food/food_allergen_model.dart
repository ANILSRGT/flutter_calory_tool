class FoodAllergenModel {
  const FoodAllergenModel({this.id, this.name, this.value});

  factory FoodAllergenModel.fromJson(Map<String, dynamic> json) {
    return FoodAllergenModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      value: json['value'] as bool?,
    );
  }

  final String? id;
  final String? name;
  final bool? value;
}
