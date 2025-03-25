part of 'cache_manager.dart';

final class _DailyFoodsCache {
  _DailyFoodsCache._init();
  static final _DailyFoodsCache _instance = _DailyFoodsCache._init();
  static _DailyFoodsCache get I => _instance;

  late final Box<FoodCacheModel> _dailyFoodsBox;

  Future<void> _init() async {
    _dailyFoodsBox = await Hive.openBox<FoodCacheModel>('daily_foods');
  }

  FoodCacheModel getDailyFoods(DateTime date) {
    final foods = _dailyFoodsBox.get(date.toUtc().toString());
    return foods ?? FoodCacheModel.empty(date.toLocal());
  }

  Future<void> toggleFood(
    FoodModel food,
    PlannedMealsEnum type,
    DateTime date,
  ) async {
    final foods = getDailyFoods(date);
    if (foods.containsFood(food.id, type)) {
      foods.removeFood(food.id, type);
    } else {
      foods.addFood(food, type);
    }
    await _dailyFoodsBox.put(date.toUtc().toString(), foods);
  }
}
