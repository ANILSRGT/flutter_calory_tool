import FoodModel from "./FoodModel";

class FoodSearchModel {
  constructor({ pageNumber, foods }) {
    this.pageNumber = pageNumber;
    this.foods = foods;
  }

  static fromJson(json) {
    const foodsJson = json["foods"];
    const foodJson = foodsJson ? foodsJson["food"] : null;
    return new FoodSearchModel({
      pageNumber: foodsJson ? foodsJson["page_number"] : null,
      foods: foodJson ? FoodModel.fromJson(foodJson) : null,
    });
  }

  toJson() {
    return {
      page_number: this.pageNumber,
      foods: this.foods ? this.foods.toJson() : null,
    };
  }
}

export default FoodSearchModel;
