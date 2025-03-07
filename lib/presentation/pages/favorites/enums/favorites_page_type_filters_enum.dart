enum FavoritesPageTypeFiltersEnum {
  recipes(displayName: 'Recipes'),
  foods(displayName: 'Foods');

  const FavoritesPageTypeFiltersEnum({required this.displayName});

  final String displayName;
}
