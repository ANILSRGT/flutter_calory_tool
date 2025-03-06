import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/presentation/pages/food/widget/food_card.dart';
import 'package:flutter/material.dart';
import 'package:calory_tool/presentation/pages/recipes/widget/reciper_card.dart';

@RoutePage()
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> allRecipes = [
    {
      'image': 'assets/breakfast.png',
      'title': 'Delicious Pancakes',
      'description': 'Fluffy and tasty pancakes for breakfast.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Grilled Chicken',
      'description': 'Perfectly grilled chicken with spices.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Veggie Salad',
      'description': 'A fresh and healthy veggie salad.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Spaghetti Bolognese',
      'description': 'A delicious classic Italian dish.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Chicken Curry',
      'description': 'A flavorful chicken curry with spices.',
    },
    {
      'image': 'assets/breakfast.png',
      'title': 'Tacos',
      'description': 'Delicious tacos with a variety of fillings.',
    },
  ];

  List<Map<String, String>> displayedRecipes = [];

  @override
  void initState() {
    super.initState();
    displayedRecipes = allRecipes;
  }

  void _filterRecipes(String query) {
    List<Map<String, String>> filteredRecipes = allRecipes.where((recipe) {
      return recipe['title']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      displayedRecipes = filteredRecipes;
    });
  }

  void _openFilterOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16.0),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filter Options",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text("Vegetarian"),
              onTap: () {
                print("Vegetarian filter selected");
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: const Text("High Protein"),
              onTap: () {
                print("High Protein filter selected");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              // Search Bar with Filter Icon
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for recipes...',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onChanged: (text) {
                          _filterRecipes(text);
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_list, color: Colors.blueAccent),
                      onPressed: _openFilterOptions,
                    ),
                  ],
                ),
              ),
              // Recipes List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: displayedRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = displayedRecipes[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: FoodCard(
                      image: recipe['image']!,
                      title: recipe['title']!,
                      description: recipe['description']!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
