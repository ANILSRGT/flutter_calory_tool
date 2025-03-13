part of 'recipe_details_page_imports.dart';

@RoutePage()
class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({super.key , required this.recipeModel});
   final RecipeModel recipeModel ;
  @override
  Widget build(BuildContext context) {
    return  _RecipeDetailsPageView(recipeModel: recipeModel,);
  }
}
