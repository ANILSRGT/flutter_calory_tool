import 'package:flutter_dotenv/flutter_dotenv.dart';

final class AppEnvironments {
  AppEnvironments._init();
  static final AppEnvironments _instance = AppEnvironments._init();
  static AppEnvironments get I => _instance;

  Future<void> init() async {
    await dotenv.load();
  }

  // String get fatsecretClientId => dotenv.env['FATSECRET_CLIENT_ID'] ?? '';
  // String get fatsecretClientSecret =>
  //     dotenv.env['FATSECRET_CLIENT_SECRET'] ?? '';
  String get fatsecretConsumerKey => dotenv.env['FATSECRET_CONSUMER_KEY'] ?? '';
  String get fatsecretConsumerSecret =>
      dotenv.env['FATSECRET_CONSUMER_SECRET'] ?? '';
}
