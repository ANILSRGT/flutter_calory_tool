import FoodAllergenModel from "./FoodAllergenModel.js";
import FoodPreferenceModel from "./FoodPreferenceModel.js";
import FoodServingModel from "./FoodServingModel.js";

class FoodModel {
  constructor({ id, name, brandName, type, subCategories, url, allergens, preferences, servings }) {
    this.id = id;
    this.name = name;
    this.brandName = brandName;
    this.type = type;
    this.subCategories = subCategories;
    this.url = url;
    this.allergens = allergens;
    this.preferences = preferences;
    this.servings = servings;
  }

  static fromJson(json) {
    const foodAttributes = json["food_attributes"];
    return new FoodModel({
      id: json["food_id"],
      name: json["food_name"],
      brandName: json["brand_name"],
      type: json["food_type"],
      subCategories: json["food_sub_categories"]?.["food_sub_category"] ?? [],
      url: json["food_url"],
      allergens: foodAttributes?.["allergens"]?.["allergen"]
        ? FoodAllergenModel.fromJson(foodAttributes["allergens"]["allergen"])
        : [],
      preferences: foodAttributes?.["preferences"]?.["preference"]
        ? FoodPreferenceModel.fromJson(foodAttributes["preferences"]["preference"])
        : [],
      servings: foodAttributes?.["servings"]?.["serving"]
        ? FoodServingModel.fromJson(foodAttributes["servings"]["serving"])
        : [],
    });
  }

  toJson() {
    return {
      food_id: this.id,
      food_name: this.name,
      brand_name: this.brandName,
      food_type: this.type,
      food_sub_categories: {
        food_sub_category: this.subCategories,
      },
      food_url: this.url,
      food_attributes: {
        allergens: {
          allergen: this.allergens.map(allergen => allergen.toJson()),
        },
        preferences: {
          preference: this.preferences.map(preference => preference.toJson()),
        },
        servings: {
          serving: this.servings.map(serving => serving.toJson()),
        },
      },
    };
  }
}

export default FoodModel;
