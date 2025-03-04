class FoodModel {
  constructor({ brandName, foodDescription, foodId, foodName, foodType, foodUrl }) {
    this.brandName = brandName;
    this.foodDescription = foodDescription;
    this.foodId = foodId;
    this.foodName = foodName;
    this.foodType = foodType;
    this.foodUrl = foodUrl;
  }

  static fromJson(json) {
    return new FoodModel({
      brandName: json["brand_name"],
      foodDescription: json["food_description"],
      foodId: json["food_id"],
      foodName: json["food_name"],
      foodType: json["food_type"],
      foodUrl: json["food_url"],
    });
  }

  toJson() {
    return {
      brand_name: this.brandName,
      food_description: this.foodDescription,
      food_id: this.foodId,
      food_name: this.foodName,
      food_type: this.foodType,
      food_url: this.foodUrl,
    };
  }
}

export default FoodModel;
