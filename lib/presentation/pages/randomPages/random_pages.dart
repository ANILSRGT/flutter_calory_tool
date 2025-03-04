import 'package:calory_tool/core/widgets/navBar/nav_bar_widget.dart';
import 'package:flutter/material.dart';

class Home1Page extends StatelessWidget {
  const Home1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBarScreen(),
    );
  }
}

class Home2Page extends StatelessWidget {
  const Home2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(pageController: PageController()),

    );
  }
}

class Home3Page extends StatelessWidget {
  const Home3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(pageController: PageController()),

    );
  }
}

class Home4Page extends StatelessWidget {
  const Home4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(pageController: PageController()),

    );
  }
}

