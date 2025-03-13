import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/core/providers/reciper_provider.dart';
import 'package:calory_tool/presentation/widgets/cards/recipe_card.dart';
import 'package:calory_tool/presentation/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  late final PentaDebounceable<void, String> _fetchSuggestions =
  PentaDebouncer.debounce(
    debounceDuration: const Duration(milliseconds: 800),
    function: (query) async {
      if (_searchText == query) return;
      _searchText = query;

      context.read<RecipeProvider>().clearRecipes();
      if (query.isEmpty) return;

      await context.read<RecipeProvider>().fetchsearchRecipe(query);
    },
  );

  @override
  Widget build(BuildContext context) {
    final items = context.watch<RecipeProvider>().recipes?.recipes
        .where((e) => e.image != null)
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 📌 Daha Modern Başlık
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              child: Column(
                children: [
                  Text(
                    'What Would You Like \n To Cook Today?',
                    textAlign: TextAlign.center,
                    style: context.ext.theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22, // Daha büyük yazı
                      fontFamily: 'Poppins', // Daha modern font
                    ),
                  ),
                  const SizedBox(height: 8),
                  Divider(color: Colors.grey.shade400, thickness: 1), // İnce çizgi
                ],
              ),
            ),

            // 📌 Modern Arama Kutusu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30), // Daha yuvarlak tasarım
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CustomTextField(
                  controller: _searchController,
                  hintText: 'Search for recipes...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  onChanged: _fetchSuggestions,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: items == null || items.isEmpty
                    ? const Center(child: CircularProgressIndicator()) // Yüklenme animasyonu
                    : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.ext.screen.width ~/ 200, // Daha dengeli
                    crossAxisSpacing: 8, // Boşluklar artırıldı
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.78, // Oran iyileştirildi
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final recipe = items[index];

                    return AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: 1.0,
                      child: RecipeCard(recipeModel: recipe),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
