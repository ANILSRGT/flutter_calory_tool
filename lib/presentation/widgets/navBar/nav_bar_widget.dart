import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:penta_core/penta_core.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  final int selectedIndex;
  final void Function(int index) onTap;

  final List<IconData> icons = [
    Icons.home,
    Icons.safety_check,
    Icons.camera_rounded,
    Icons.no_meals_ouline,
  ];

  final List<String> labels = ['Home', 'Plan', 'Challenges', 'Recipes'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = screenHeight * 0.01;

    return Observer(
      builder:
          (_) => Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.appThemeExt.appColors.background.byBrightness(
                context.ext.theme.isDark,
              ), // Set background color to white
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: padding,
                horizontal: padding * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(icons.length, (index) {
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () => onTap(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? context.appThemeExt.appColors.primary
                                    .withValues(alpha: 0.2)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                icons[index],
                                color:
                                    isSelected
                                        ? context.appThemeExt.appColors.primary
                                        : context
                                            .appThemeExt
                                            .appColors
                                            .grey, // Icon color changes to blue when selected
                                size: 28,
                              ),
                              if (isSelected) const SizedBox(width: 6),
                              Text(
                                labels[index],
                                style: context.ext.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                      color:
                                          isSelected
                                              ? context
                                                  .appThemeExt
                                                  .appColors
                                                  .primary
                                              : context
                                                  .appThemeExt
                                                  .appColors
                                                  .grey, // Text color changes to blue when selected
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
    );
  }
}
