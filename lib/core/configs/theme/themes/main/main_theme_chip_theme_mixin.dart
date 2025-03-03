part of 'main_theme.dart';

mixin MainThemeChipTheme implements MainThemeAppColorsMixin {
  ChipThemeData chipTheme(bool isDark) {
    return ChipThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      showCheckmark: false,
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      secondaryLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
