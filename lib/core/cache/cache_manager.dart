import 'package:calory_tool/core/configs/enums/app_localiaztions_enum.dart';
import 'package:calory_tool/core/configs/enums/app_themes_enum.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_configs_cache.dart';

final class CacheManager {
  CacheManager._init();
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get I => _instance;

  _UserConfigsCache get userConfigs => _UserConfigsCache.I;

  Future<void> init() async {
    await Hive.initFlutter();
    await userConfigs._init();
  }

  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }
}
