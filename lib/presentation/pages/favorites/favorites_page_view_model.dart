import 'package:calory_tool/presentation/pages/favorites/enums/favorites_page_type_filters_enum.dart';
import 'package:mobx/mobx.dart';

part 'favorites_page_view_model.g.dart';

class FavoritesPageViewModel = _FavoritesPageViewModelBase
    with _$FavoritesPageViewModel;

abstract class _FavoritesPageViewModelBase with Store {
  @observable
  FavoritesPageTypeFiltersEnum _typeFilter = FavoritesPageTypeFiltersEnum.foods;

  @computed
  FavoritesPageTypeFiltersEnum get typeFilter => _typeFilter;

  @action
  void setTypeFilter(FavoritesPageTypeFiltersEnum typeFilter) {
    _typeFilter = typeFilter;
  }
}
