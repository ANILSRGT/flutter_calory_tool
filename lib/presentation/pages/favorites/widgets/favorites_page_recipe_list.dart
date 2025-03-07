part of '../favorites_page_imports.dart';

class _FavoritesPageRecipeList extends StatelessWidget {
  const _FavoritesPageRecipeList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.ext.screen.width ~/ 180,
        crossAxisSpacing: AppValues.sm.value,
        mainAxisSpacing: AppValues.sm.value,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return const RecipeCard(image: 'assets/breakfast.png', title: 'title');
      },
    );
  }
}
