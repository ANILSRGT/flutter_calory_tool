import 'package:calory_tool/presentation/pages/recipes/widget/reciper_card.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> allRecipes = [
    {'image': 'assets/breakfast.png', 'title': 'Delicious Pancakes', 'description': 'Fluffy and tasty pancakes.'},
    {'image': 'assets/breakfast.png', 'title': 'Grilled Chicken', 'description': 'Perfectly grilled chicken.'},
    {'image': 'assets/breakfast.png', 'title': 'Veggie Salad', 'description': 'A fresh and healthy veggie salad.'},
    {'image': 'assets/breakfast.png', 'title': 'Spaghetti Bolognese', 'description': 'A delicious Italian dish.'},
    {'image': 'assets/breakfast.png', 'title': 'Chicken Curry', 'description': 'A flavorful chicken curry.'},
    {'image': 'assets/breakfast.png', 'title': 'Tacos', 'description': 'Delicious tacos with fillings.'},
  ];

  List<Map<String, String>> displayedRecipes = [];

  @override
  void initState() {
    super.initState();
    displayedRecipes = allRecipes;
  }

  void _filterRecipes(String query) {
    setState(() {
      displayedRecipes = allRecipes
          .where((recipe) => recipe['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for recipes...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterRecipes,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: displayedRecipes.length,
          itemBuilder: (context, index) {
            final recipe = displayedRecipes[index];
            return RecipeCard(
              image: recipe['image']!,
              title: recipe['title']!,
              description: recipe['description']!,
            );
          },
        ),
      ),
    );
  }
}
