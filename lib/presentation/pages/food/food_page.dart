import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/presentation/widgets/cards/food_card.dart';
import 'package:calory_tool/presentation/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

@RoutePage()
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _searchController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              CustomTextField(
                controller: _searchController,
                hintText: 'Search for recipes...',
                prefixIcon: const Icon(Icons.search),
              ),
              ...AppValues.xl6.ext.sizedBox.vertical.ext.widget * 2,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: displayedRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = displayedRecipes[index];
                  return Padding(
                    padding: AppValues.lg.ext.padding.directional.bottom,
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
