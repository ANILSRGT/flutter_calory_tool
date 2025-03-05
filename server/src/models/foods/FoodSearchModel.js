import FoodModel from "./FoodModel.js";

class FoodSearchModel {
  constructor({ pageNumber, foods }) {
    this.pageNumber = pageNumber;
    this.foods = foods;
  }

  static fromJson(json) {
    const foodsSearchJson = json["foods_search"];
    const foodsJson = foodsSearchJson?.["results"] ?? null;
    const foodJson = foodsJson?.["food"] ?? null;
    return new FoodSearchModel({
      pageNumber: foodsJson?.["page_number"] ? parseInt(foodsJson["page_number"]) : null,
      food: foodJson?.map(food => FoodModel.fromJson(food)) ?? null,
    });
  }

  toJson() {
    return {
      page_number: this.pageNumber,
      foods: this.foods ? this.foods.map(food => food.toJson()) : null,
    };
  }
}

export default FoodSearchModel;
