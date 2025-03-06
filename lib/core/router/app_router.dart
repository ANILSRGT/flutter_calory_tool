import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/presentation/pages/food/food_page.dart';
import 'package:calory_tool/presentation/pages/home/home_page.dart';
import 'package:calory_tool/presentation/pages/main/main_page.dart';
import 'package:calory_tool/presentation/pages/recipes/recipes_page.dart';
import 'package:calory_tool/presentation/pages/summary/summary_page_imports.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.custom(transitionsBuilder: TransitionsBuilders.fadeIn);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: RecipesRoute.page),
    AutoRoute(page: SummaryRoute.page),
    AutoRoute(page: FoodRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}
