import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/presentation/pages/recipes/widget/reciper_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> allRecipes = [
    {
      'image': 'assets/breakfast.png',
      'title': 'Delicious Pancakes',
      'description': 'Fluffy and tasty pancakes.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Grilled Chicken',
      'description': 'Perfectly grilled chicken.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Veggie Salad',
      'description': 'A fresh and healthy veggie salad.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Spaghetti Bolognese',
      'description': 'A delicious Italian dish.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Chicken Curry',
      'description': 'A flavorful chicken curry.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Tacos',
      'description': 'Delicious tacos with fillings.',
    },
  ];

  List<Map<String, String>> displayedRecipes = [];

  @override
  void initState() {
    super.initState();
    displayedRecipes = allRecipes;
  }

  void _filterRecipes(String query) {
    setState(() {
      displayedRecipes =
          allRecipes
              .where(
                (recipe) => recipe['title']!.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Custom AppBar with more elegant design
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                'Recipes',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 1.2,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.black87),
                  onPressed: () {
                    // Implement filtering action
                  },
                ),
              ],
            ),

            // Search bar with elegant style
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for recipes...',
                  hintStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.green[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onChanged: _filterRecipes,
              ),
            ),

            // Section Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                'Trending Recipes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: displayedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = displayedRecipes[index];
                return RecipeCard(
                  image: recipe['image']!,
                  title: recipe['title']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
