import 'package:get_it/get_it.dart';

final class Injection {
  Injection._init();
  static final Injection _instance = Injection._init();
  static Injection get I => _instance;

  final _sl = GetIt.instance;

  void init() {}

  T read<T extends Object>() => _sl.get<T>();
}
