import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/presentation/pages/food/widget/food_card.dart';
import 'package:flutter/material.dart';

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for recipes...',
                          filled: true,
                          fillColor: Colors.green[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        ),

                      ),

              ),
              SizedBox(height: 15,),
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
