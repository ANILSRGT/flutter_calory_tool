import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/presentation/pages/recipes/widget/reciper_card.dart';
import 'package:calory_tool/presentation/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              title: Text(
                'Recipes',
                style: context.ext.theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // Implement filtering action
                  },
                ),
              ],
            ),

            // Search bar with elegant style
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: CustomTextField(
                controller: _searchController,
                hintText: 'Search for recipes...',
                prefixIcon: const Icon(Icons.search),
                onChanged: _filterRecipes,
              ),
            ),

            // Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Text(
                'Trending Recipes',
                style: context.ext.theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
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
