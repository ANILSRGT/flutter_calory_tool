part of 'cache_manager.dart';

final class _DailyFoodsCache {
  _DailyFoodsCache._init();
  static final _DailyFoodsCache _instance = _DailyFoodsCache._init();
  static _DailyFoodsCache get I => _instance;

  late final Box<FoodCacheModel> _dailyFoodsBox;

  final String _dailyFoodsName = 'dailyFoods';

  Future<void> _init() async {
    _dailyFoodsBox = await Hive.openBox(_dailyFoodsName);
  }

  FoodCacheModel getDailyFoods(DateTime date) {
    final foods = _dailyFoodsBox.get(
      DateFormat('yyyy-MM-dd').format(date.toUtc()),
    );

    return foods ?? FoodCacheModel.empty(date.toLocal());
  }

  Future<void> toggleFood(
    FoodModel food,
    PlannedMealsEnum type,
    DateTime date,
  ) async {
    final foods = getDailyFoods(date);

    foods.foodEntries.putIfAbsent(type, () => []);

    final hasFood = foods.foodEntries[type]!.any((e) => e.id == food.id);
    if (hasFood) {
      foods.foodEntries[type]!.removeWhere((e) => e.id == food.id);
    } else {
      foods.foodEntries[type]!.add(food);
    }

    await _dailyFoodsBox.put(
      DateFormat('yyyy-MM-dd').format(date.toUtc()),
      foods.copyWith(foodEntries: foods.foodEntries),
    );
  }
}
