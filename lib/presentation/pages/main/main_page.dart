import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/core/widgets/navBar/nav_bar_widget.dart';
import 'package:calory_tool/presentation/pages/food/food_page.dart';
import 'package:calory_tool/presentation/pages/home/home_page.dart';
import 'package:calory_tool/presentation/pages/main/store/navigation_store.dart';
import 'package:calory_tool/presentation/pages/recipes/recipes_page.dart';
import 'package:calory_tool/presentation/pages/summary/summary_page_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    const HomePage(),
    const FoodPage(),
    const SummaryPage(),
    const RecipesPage(),
  ];

  final PageController _pageController = PageController();
  final NavigationStore _navigationStore = NavigationStore();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white54,
      bottomNavigationBar: Observer(
        builder: (_) {
          return CustomBottomNavBar(
            selectedIndex: _navigationStore.selectedIndex,
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: Durations.medium3,
                curve: Curves.ease,
              );
            },
          );
        },
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return PageView(
              controller: _pageController,
              onPageChanged: _navigationStore.setIndex,
              children: pages,
            );
          },
        ),
      ),
    );
  }
}
