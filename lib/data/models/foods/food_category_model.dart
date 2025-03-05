class FoodCategoryModel {
  const FoodCategoryModel({this.id, this.name, this.description});

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    return FoodCategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );
  }

  final String? id;
  final String? name;
  final String? description;
}
