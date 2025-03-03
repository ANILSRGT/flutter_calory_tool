import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

part 'fatsecret_api_injection_mixin.dart';

final class Injection with FatsecretApiInjectionMixin {
  Injection._init();
  static final Injection _instance = Injection._init();
  static Injection get I => _instance;

  final _sl = GetIt.instance;

  void init() {
    fatsecretApiInjection();
  }

  T read<T extends Object>() => _sl.get<T>();
}
