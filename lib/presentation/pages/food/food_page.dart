import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/core/providers/food_provider.dart';
import 'package:calory_tool/presentation/widgets/cards/food_card.dart';
import 'package:calory_tool/presentation/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _searchController = TextEditingController();

  String _searchText='';

  late final PentaDebounceable<void, String> _fetchSuggestions =
  PentaDebouncer.debounce(
    debounceDuration: const Duration(milliseconds: 1000),
    function: (query) async {
      if (_searchText == query) return;
      _searchText = query;

      context.read<FoodProvider>().clearFoods();
      if (query.isEmpty) {
        return;
      }

      context.read<FoodProvider>().fetchsearchfoods(query);
    },
  );



  @override
  Widget build(BuildContext context) {
    final items=context.watch<FoodProvider>().foods?.foods.where((e)=>e.imageUrl!=null).toList();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 15.0),
              child: Text(
                'What Would You Like \n To Cook Today?',textAlign: TextAlign.center,
                style: context.ext.theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: _searchController,
                hintText: 'Search for recipes...',
                prefixIcon: const Icon(Icons.search),
                onChanged: _fetchSuggestions,

              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.ext.screen.width~/180,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: items?.length ?? 0,
                  itemBuilder: (context, index) {
                    final food = items![index];
                    return FoodCard(foodModel:food);
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
