import 'package:calory_tool/data/datasources/fatsecret/fatsecret_remote_datasource.dart';
import 'package:calory_tool/data/models/food_search_model.dart';
import 'package:calory_tool/data/params/fatsecret_api_search_food_params.dart';
import 'package:calory_tool/injections/injection.dart';
import 'package:penta_core/penta_core.dart';

class FatsecretApiRepo {
  Future<ResponseModel<FoodSearchModel>> searchFood(
    FatsecretApiSearchFoodParams params,
  ) async {
    return Injection.I.read<FatsecretRemoteDatasource>().searchFood(params);
  }
}
