import 'package:hive_flutter/hive_flutter.dart';

part 'planned_meals_enum.g.dart';

@HiveType(typeId: 13)
enum PlannedMealsEnum {
  @HiveField(0)
  breakfast(displayName: 'Breakfast'),
  @HiveField(1)
  lunch(displayName: 'Lunch'),
  @HiveField(2)
  dinner(displayName: 'Dinner'),
  @HiveField(3)
  snacks(displayName: 'Snacks');

  const PlannedMealsEnum({required this.displayName});

  final String displayName;
}
