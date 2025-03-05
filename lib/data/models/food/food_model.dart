class FoodModel {
  const FoodModel({
    this.id,
    this.name,
    this.description,
    this.type,
    this.url,
    this.brandName,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['food_id'] as String?,
      name: json['food_name'] as String?,
      description: json['food_description'] as String?,
      type: json['food_type'] as String?,
      url: json['food_url'] as String?,
      brandName: json['brand_name'] as String?,
    );
  }

  final String? id;
  final String? name;
  final String? description;
  final String? type;
  final String? url;
  final String? brandName;
}
