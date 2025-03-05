class FoodServingModel {
  constructor({
    id,
    description,
    url,
    metricServingAmount,
    metricServingUnit,
    numberOfUnits,
    measurementDescription,
    calories,
    carbohydrate,
    protein,
    fat,
    saturatedFat,
    polyunsaturatedFat,
    monounsaturatedFat,
    transFat,
    cholesterol,
    sodium,
    potassium,
    fiber,
    sugar,
    addedSugars,
    vitaminA,
    vitaminC,
    vitaminD,
    calcium,
    iron,
  }) {
    this.id = id;
    this.description = description;
    this.url = url;
    this.metricServingAmount = metricServingAmount;
    this.metricServingUnit = metricServingUnit;
    this.numberOfUnits = numberOfUnits;
    this.measurementDescription = measurementDescription;
    this.calories = calories;
    this.carbohydrate = carbohydrate;
    this.protein = protein;
    this.fat = fat;
    this.saturatedFat = saturatedFat;
    this.polyunsaturatedFat = polyunsaturatedFat;
    this.monounsaturatedFat = monounsaturatedFat;
    this.transFat = transFat;
    this.cholesterol = cholesterol;
    this.sodium = sodium;
    this.potassium = potassium;
    this.fiber = fiber;
    this.sugar = sugar;
    this.addedSugars = addedSugars;
    this.vitaminA = vitaminA;
    this.vitaminC = vitaminC;
    this.vitaminD = vitaminD;
    this.calcium = calcium;
    this.iron = iron;
  }

  static fromJson(json) {
    return new FoodServingModel({
      id: json["serving_id"],
      description: json["serving_description"],
      url: json["serving_url"],
      metricServingAmount: json["metric_serving_amount"] ? parseFloat(json["metric_serving_amount"]) : null,
      metricServingUnit: json["metric_serving_unit"],
      numberOfUnits: json["number_of_units"] ? parseFloat(json["number_of_units"]) : null,
      measurementDescription: json["measurement_description"],
      calories: json["calories"] ? parseFloat(json["calories"]) : null,
      carbohydrate: json["carbohydrate"] ? parseFloat(json["carbohydrate"]) : null,
      protein: json["protein"] ? parseFloat(json["protein"]) : null,
      fat: json["fat"] ? parseFloat(json["fat"]) : null,
      saturatedFat: json["saturated_fat"] ? parseFloat(json["saturated_fat"]) : null,
      polyunsaturatedFat: json["polyunsaturated_fat"] ? parseFloat(json["polyunsaturated_fat"]) : null,
      monounsaturatedFat: json["monounsaturated_fat"] ? parseFloat(json["monounsaturated_fat"]) : null,
      transFat: json["trans_fat"] ? parseFloat(json[trans_fat]) : null,
      cholesterol: json["cholesterol"] ? parseFloat(json["cholesterol"]) : null,
      sodium: json["sodium"] ? parseFloat(json["sodium"]) : null,
      potassium: json["potassium"] ? parseFloat(json["potassium"]) : null,
      fiber: json["fiber"] ? parseFloat(json["fiber"]) : null,
      sugar: json["sugar"] ? parseFloat(json["sugar"]) : null,
      addedSugars: json["added_sugars"] ? parseFloat(json["added_sugars"]) : null,
      vitaminA: json["vitamin_a"] ? parseFloat(json["vitamin_a"]) : null,
      vitaminC: json["vitamin_c"] ? parseFloat(json["vitamin_c"]) : null,
      vitaminD: json["vitamin_d"] ? parseFloat(json["vitamin_d"]) : null,
      calcium: json["calcium"] ? parseFloat(json["calcium"]) : null,
      iron: json["iron"] ? parseFloat(json["iron"]) : null,
    });
  }

  toJson() {
    return {
      id: this.id,
      description: this.description,
      url: this.url,
      metricServingAmount: this.metricServingAmount,
      metricServingUnit: this.metricServingUnit,
      numberOfUnits: this.numberOfUnits,
      measurementDescription: this.measurementDescription,
      calories: this.calories,
      carbohydrate: this.carbohydrate,
      protein: this.protein,
      fat: this.fat,
      saturatedFat: this.saturatedFat,
      polyunsaturatedFat: this.polyunsaturatedFat,
      monounsaturatedFat: this.monounsaturatedFat,
      transFat: this.transFat,
      cholesterol: this.cholesterol,
      sodium: this.sodium,
      potassium: this.potassium,
      fiber: this.fiber,
      sugar: this.sugar,
      addedSugars: this.addedSugars,
      vitaminA: this.vitaminA,
      vitaminC: this.vitaminC,
      vitaminD: this.vitaminD,
      calcium: this.calcium,
      iron: this.iron,
    };
  }
}

export default FoodServingModel;
