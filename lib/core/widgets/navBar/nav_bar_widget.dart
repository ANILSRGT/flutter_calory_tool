import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/presentation/pages/home/home_page.dart';
import 'package:calory_tool/presentation/pages/home/store/navigation_store.dart';
import 'package:calory_tool/presentation/pages/randomPages/random_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NavBarScreen extends StatefulWidget {
  NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Widget> pages = [
    const HomePage(),
    const Home1Page(),
    const Home2Page(),
    const Home3Page(),
    const Home4Page(),
  ];

  final PageController _pageController = PageController();

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
      bottomNavigationBar: CustomBottomNavBar(pageController: _pageController),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                navigationStore.setIndex(index);
              },
              children: pages,
            );
          },
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final PageController pageController; // Accept the PageController

  final List<IconData> icons = [
    Icons.home,
    Icons.safety_check,
    Icons.camera_rounded,
    Icons.video_camera_back_outlined,
    Icons.favorite,
  ];

  final List<String> labels = [
    'Home',
    'Asteriod',
    'Rover',
    'Video',
    'Favorite',
  ];

  CustomBottomNavBar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenHeight * 0.01;

    return Observer(
      builder: (_) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              bool isSelected = navigationStore.selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  // When a tab is tapped, update the PageController's page
                  pageController.jumpToPage(index);
                  navigationStore.setIndex(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue.withOpacity(0.2) // Blue color for selected tab
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        icons[index],
                        color: isSelected ? Colors.blue : Colors.white, // Blue for selected icon
                        size: 28,
                      ),
                      if (isSelected) const SizedBox(width: 6),
                      if (isSelected)
                        Text(
                          labels[index],
                          style: const TextStyle(
                            color: Colors.blue, // Blue color for selected label
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
