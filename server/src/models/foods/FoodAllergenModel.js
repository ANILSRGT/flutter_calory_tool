class FoodAllergenModel {
  constructor({ id, name, value }) {
    this.id = id;
    this.name = name;
    this.value = value;
  }

  static fromJson(json) {
    return new FoodAllergenModel({
      id: json["allergen_id"],
      name: json["allergen_name"],
      value: json["allergen_value"] == "1" ? true : json["allergen_value"] == "0" ? false : null,
    });
  }
}

export default FoodAllergenModel;
