class FoodPreferenceModel {
  const FoodPreferenceModel({required this.id, required this.name, this.value});

  factory FoodPreferenceModel.fromJson(Map<String, dynamic> json) {
    return FoodPreferenceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      value: json['value'] as bool?,
    );
  }

  final String? id;
  final String? name;
  final bool? value;
}
