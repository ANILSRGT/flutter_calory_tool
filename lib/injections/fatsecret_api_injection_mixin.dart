part of 'injection.dart';

mixin FatsecretApiInjectionMixin {
  void fatsecretApiInjection(GetIt sl) {
    final fatsecretDio = Dio(
      BaseOptions(
        baseUrl: 'localhost:3000/api/v1',
        headers: {'Content-Type': 'application/json'},
        queryParameters: {},
      ),
    );

    sl
      ..registerLazySingleton(() => fatsecretDio)
      ..registerLazySingleton(
        () => FatsecretRemoteDatasource(fatsecretDio: sl()),
      )
      ..registerLazySingleton(FatsecretApiRepo.new);
  }
}
