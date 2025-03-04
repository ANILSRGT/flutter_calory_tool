import axios from "axios";
import { fatsecretApiKey } from "../../index";
import FoodSearchModel from "../models/foods/FoodSearchModel";

class FatsecretFoodService {
  async searchFoods(query) {
    try {
      const response = await axios.get(
        `https://platform.fatsecret.com/rest/foods/search/v3?search_expression=${query}&format=json&region=US&language=en`,
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${fatsecretApiKey}`,
          },
        }
      );

      if (!response.data) {
        return { message: "No data found", status: 404 };
      }

      return { data: FoodSearchModel.fromJson(response.data), status: 200 };
    } catch (error) {
      return { message: "Something went wrong" };
    }
  }
}

export default new FatsecretFoodService();
