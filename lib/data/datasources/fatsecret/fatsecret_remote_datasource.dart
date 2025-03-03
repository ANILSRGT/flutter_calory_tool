import 'package:calory_tool/data/models/food_search_model.dart';
import 'package:calory_tool/data/params/fatsecret_api_search_food_params.dart';
import 'package:dio/dio.dart';
import 'package:penta_core/penta_core.dart';

final class FatsecretRemoteDatasource {
  const FatsecretRemoteDatasource({required Dio fatsecretDio})
    : _fatsecretDio = fatsecretDio;

  final Dio _fatsecretDio;

  Future<ResponseModel<FoodSearchModel>> searchFood(
    FatsecretApiSearchFoodParams params,
  ) async {
    try {
      final res = await _fatsecretDio.get<Map<String, dynamic>>(
        '/foods/search/v3',
        queryParameters: params.toMap(),
      );

      if (res.data == null) {
        return const ResponseModelFail(
          error: ErrorModel(
            message: 'No data found',
            throwMessage: 'fatsecret_remote_datasource/null: No data found',
          ),
        );
      }

      return ResponseModelSuccess(data: FoodSearchModel.fromJson(res.data!));
    } on Exception {
      return const ResponseModelFail(
        error: ErrorModel(
          message: 'Failed to search food',
          throwMessage:
              'fatsecret_remote_datasource/searchFood/catch: Failed to search food',
        ),
      );
    }
  }
}
