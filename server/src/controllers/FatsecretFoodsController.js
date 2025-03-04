import FatsecretFoodsService from "../services/FatsecretFoodService";

class FatsecretFoodsController {
  async search(req, res) {
    try {
      const { query } = req.query;
      const foods = await FatsecretFoodsService.searchFoods(query);
      res.status(foods.status).json(foods);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  }
}

export default new FatsecretFoodsController();
