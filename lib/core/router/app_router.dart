import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.custom(transitionsBuilder: TransitionsBuilders.fadeIn);

  @override
  List<AutoRoute> get routes => [];

  @override
  List<AutoRouteGuard> get guards => [];
}
