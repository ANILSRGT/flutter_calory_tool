part of '../favorites_page_imports.dart';

class _FavoritesPageFoodList extends StatelessWidget {
  const _FavoritesPageFoodList();

  @override
  Widget build(BuildContext context) {
    final foods = context.watch<FavoritesProvider>().foods;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: foods.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.ext.screen.width ~/ 180,
        crossAxisSpacing: AppValues.sm.value,
        mainAxisSpacing: AppValues.sm.value,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final item = foods[index];

        return FoodCard(foodModel: item);
      },
    );
  }
}
