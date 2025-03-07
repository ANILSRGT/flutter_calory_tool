
import 'package:calory_tool/data/models/foods/food_search_model.dart';
import 'package:calory_tool/data/params/fatsecret_api_search_food_params.dart';
import 'package:calory_tool/data/repositories/fatsecret_api_repo.dart';
import 'package:calory_tool/injections/injection.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

final class FoodProvider extends ChangeNotifier {
  FoodSearchModel? foods ;
  bool isLoading = false;
  Future<void> fetchsearchfoods(String query)async{
    isLoading=true;
    notifyListeners();
   final res=await Injection.I.read<FatsecretApiRepo>().searchFood(FatsecretApiSearchFoodParams(query: query));
    res.when(onSuccess: (data) {
      foods= data;
    }, onFail: (fail) {
        showToast(fail.error.message);
    },);
    isLoading=false;
    notifyListeners();

  }
  void clearFoods(){
    foods= null;
    notifyListeners();
  }

}
