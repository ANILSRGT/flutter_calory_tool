import FoodModel from "./FoodModel.js";

class FoodSearchModel {
  constructor({ pageNumber, food }) {
    this.pageNumber = pageNumber;
    this.food = food;
  }

  static fromJson(json) {
    const foodsJson = json["foods"];
    const foodJson = foodsJson ? foodsJson["food"] : null;
    return new FoodSearchModel({
      pageNumber: foodsJson ? foodsJson["page_number"] : null,
      food: foodJson ? FoodModel.fromJson(foodJson) : null,
    });
  }

  toJson() {
    return {
      page_number: this.pageNumber,
      food: this.food ? this.food.toJson() : null,
    };
  }
}

export default FoodSearchModel;
