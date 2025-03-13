import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/core/providers/favorite_provider.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/presentation/pages/food_detail_page/allergens/allergens_page.dart';
import 'package:calory_tool/presentation/pages/food_detail_page/serving/serving_page.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key,required this.foodModel});


  final FoodModel foodModel ;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppValues.md.ext.padding.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(
                    title:  Text(widget.foodModel.name??'N/A'),
                    actions: [
                      IconButton(
                        onPressed: () {
                          context.read<FavoritesProvider>().toogleFavoriteFood(widget.foodModel);
                        },
                        icon: Icon(
                          context.watch<FavoritesProvider>().foods.any((e) => e.id == widget.foodModel.id)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                        ),
                      ),

                    ],
                    centerTitle: true),
                Image.network(
                  widget.foodModel.imageUrl ??'',
                  width: context.ext.screen.byOrientation(
                    portrait: context.ext.screen.width * 0.5,
                    landscape: context.ext.screen.height * 0.5,
                  ),
                  height: context.ext.screen.byOrientation(
                    portrait: context.ext.screen.width * 0.5,
                    landscape: context.ext.screen.height * 0.5,
                  ),
                  fit: BoxFit.contain,
                ),
                AppValues.md.ext.sizedBox.vertical,
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: AppValues.sm.value,
                  children: List.generate(widget.foodModel.subCategories.length, (index) {
                    final category = widget.foodModel.subCategories[index];
                    return Chip(label: Text(category));
                  }),
                ),
                AppValues.md.ext.sizedBox.vertical,
                if(widget.foodModel.brandName!= null)
                Text(
                  widget.foodModel.brandName!,
                  textAlign: TextAlign.center,
                  style: context.ext.theme.textTheme.bodyLarge,
                ),
                AppValues.md.ext.sizedBox.vertical,

                // TabBar
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Serving'),
                    Tab(text: 'Allergens'),
                    Tab(text: 'Preferences'),
                  ],
                ),

                SizedBox(
                  height: 200,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Serving(foodServingModel: widget.foodModel.servings,),
                      AllergensPage(),
                      const Center(child: Text('Related foods content')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


