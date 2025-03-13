part of '../favorites_page_imports.dart';

class _FavoritesPageFoodList extends StatelessWidget {
  const _FavoritesPageFoodList();

  @override
  Widget build(BuildContext context) {
    final foods = context.watch<FavoritesProvider>().foods;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: foods.length,
      separatorBuilder: (context, index) => AppValues.xl.ext.sizedBox.vertical,
      itemBuilder: (context, index) {
          final item = foods[index];

        return FoodCard(foodModel: item);
      },
    );
  }
}
