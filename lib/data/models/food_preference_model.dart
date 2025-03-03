class FoodPreferenceModel {
  const FoodPreferenceModel({this.id, this.name, this.value});

  factory FoodPreferenceModel.fromJson(Map<String, dynamic> json) {
    return FoodPreferenceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      value: json['value'] as bool?,
    );
  }

  factory FoodPreferenceModel.fromMap(Map<String, dynamic> map) {
    return FoodPreferenceModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
      value: map['value'] as bool?,
    );
  }

  final String? id;
  final String? name;
  final bool? value;
}
