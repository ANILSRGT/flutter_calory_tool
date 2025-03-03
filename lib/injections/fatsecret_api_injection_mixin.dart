part of 'injection.dart';

mixin FatsecretApiInjectionMixin {
  final _sl = GetIt.instance;

  void fatsecretApiInjection() {
    final fatsecretDio = Dio(
      BaseOptions(
        baseUrl: 'https://platform.fatsecret.com/rest',
        headers: {'Content-Type': 'application/json'},
        queryParameters: {'format': 'json', 'language': 'en', 'region': 'US'},
      ),
    );
  }
}
