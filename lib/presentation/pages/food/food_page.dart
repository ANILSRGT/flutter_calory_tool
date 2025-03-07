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
                onChanged: (value) {
                  _fetchSuggestions(value);
                },
              ),
              ...AppValues.xl6.ext.sizedBox.vertical.ext.widget * 2,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context.watch<FoodProvider>().foods?.foods.length?? 0,

                itemBuilder: (context, index) {
                  final food = context.watch<FoodProvider>().foods!.foods[index];
                  return Padding(
                    padding: AppValues.lg.ext.padding.directional.bottom,
                    child: FoodCard(
                    foodModel: food,
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
