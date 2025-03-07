part of 'injection.dart';

mixin FatsecretApiInjectionMixin {
  void fatsecretApiInjection(GetIt sl) {
    print(AppEnvironments.I.serverApiUrl);
    final fatsecretDio = Dio(
      BaseOptions(
        baseUrl: AppEnvironments.I.serverApiUrl,
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
