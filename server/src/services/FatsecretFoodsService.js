import axios from "axios";
import { fatsecretApiKey } from "../../index.js";
import FoodSearchModel from "../models/foods/FoodSearchModel.js";

class FatsecretFoodService {
  async searchFoods(query) {
    try {
      const response = await axios.get(
        `https://platform.fatsecret.com/rest/foods/search/v3?search_expression=${query}&format=json&region=US&language=en&include_food_attributes=true&include_sub_categories=true&include_food_images=true`,
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${fatsecretApiKey}`,
          },
        }
      );

      console.log(response.data["foods_search"]["results"]["food"][0]["servings"]["serving"]);

      if (!response.data || response.data.error) {
        return { message: "No data found", status: 404 };
      }

      return { data: FoodSearchModel.fromJson(response.data), status: 200 };
    } catch (error) {
      return { message: "Something went wrong", status: 500 };
    }
  }
}

export default new FatsecretFoodService();
