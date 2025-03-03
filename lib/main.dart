import 'package:calory_tool/app.dart';
import 'package:calory_tool/core/cache/cache_manager.dart';
import 'package:calory_tool/core/configs/enums/app_localiaztions_enum.dart';
import 'package:calory_tool/core/providers/localization_notifier.dart';
import 'package:calory_tool/core/providers/theme_notifier.dart';
import 'package:calory_tool/injections/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //~ Initialize Dependencies
  //await EasyLocalization.ensureInitialized();

  //~ Initialize Instances
  Injection.I.init();
  await CacheManager.I.init();

  //~ Initialize Providers
 // final localizationNotifier = LocalizationNotifier();

  final themeNotifier = ThemeNotifier();
  await themeNotifier.init();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => themeNotifier),
        ],
        child: const MyApp(),
      ),

  );
}
