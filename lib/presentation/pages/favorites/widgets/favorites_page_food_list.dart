part of '../favorites_page_imports.dart';

class _FavoritesPageFoodList extends StatelessWidget {
  const _FavoritesPageFoodList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (context, index) => AppValues.xl.ext.sizedBox.vertical,
      itemBuilder: (context, index) {

        return Text('data');
      },
    );
  }
}
