class FoodPreferenceModel {
  const FoodPreferenceModel({this.id, this.name, this.value});

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
