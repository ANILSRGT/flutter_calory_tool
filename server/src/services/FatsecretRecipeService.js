import axios from "axios";
import { fatsecretApiKey } from "../../index";
import RecipeSearchModel from "../models/recipes/recipe_search_model";

class FatsecretRecipeService {
  async searchRecipes(query) {
    try {
      const response = await axios.get(
        `https://platform.fatsecret.com/rest/recipes/search/v3?search_expression=${query}&format=json&region=US&language=en`,
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${fatsecretApiKey}`,
          },
        }
      );

      if (!response.data) {
        return { error: "No data found" };
      }

      return { data: RecipeSearchModel.fromJson(response.data) };
    } catch (error) {
      return { error: "Something went wrong" };
    }
  }
}

export default new FatsecretRecipeService();
