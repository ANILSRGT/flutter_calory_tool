// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesPage();
    },
  );
}

/// generated route for
/// [FoodDetailPage]
class FoodDetailRoute extends PageRouteInfo<FoodDetailRouteArgs> {
  FoodDetailRoute({
    Key? key,
    required FoodModel foodModel,
    List<PageRouteInfo>? children,
  }) : super(
          FoodDetailRoute.name,
          args: FoodDetailRouteArgs(
            key: key,
            foodModel: foodModel,
          ),
          initialChildren: children,
        );

  static const String name = 'FoodDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FoodDetailRouteArgs>();
      return FoodDetailPage(
        key: args.key,
        foodModel: args.foodModel,
      );
    },
  );
}

class FoodDetailRouteArgs {
  const FoodDetailRouteArgs({
    this.key,
    required this.foodModel,
  });

  final Key? key;

  final FoodModel foodModel;

  @override
  String toString() {
    return 'FoodDetailRouteArgs{key: $key, foodModel: $foodModel}';
  }
}

/// generated route for
/// [FoodPage]
class FoodRoute extends PageRouteInfo<void> {
  const FoodRoute({List<PageRouteInfo>? children})
      : super(
          FoodRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FoodPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [InfoPage]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
      : super(
          InfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InfoPage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [RecipeDetailsPage]
class RecipeDetailsRoute extends PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({
    Key? key,
    required RecipeModel recipeModel,
    List<PageRouteInfo>? children,
  }) : super(
          RecipeDetailsRoute.name,
          args: RecipeDetailsRouteArgs(
            key: key,
            recipeModel: recipeModel,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipeDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeDetailsRouteArgs>();
      return RecipeDetailsPage(
        key: args.key,
        recipeModel: args.recipeModel,
      );
    },
  );
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({
    this.key,
    required this.recipeModel,
  });

  final Key? key;

  final RecipeModel recipeModel;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{key: $key, recipeModel: $recipeModel}';
  }
}

/// generated route for
/// [RecipesPage]
class RecipesRoute extends PageRouteInfo<void> {
  const RecipesRoute({List<PageRouteInfo>? children})
      : super(
          RecipesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecipesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RecipesPage();
    },
  );
}

/// generated route for
/// [SummaryPage]
class SummaryRoute extends PageRouteInfo<void> {
  const SummaryRoute({List<PageRouteInfo>? children})
      : super(
          SummaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SummaryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SummaryPage();
    },
  );
}
