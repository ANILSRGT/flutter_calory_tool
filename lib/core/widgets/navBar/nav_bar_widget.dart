import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
            decoration: const BoxDecoration(
              color: Colors.white, // Set background color to white
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
                                ? Colors.blue.withValues(alpha: 0.2)
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
                                        ? Colors.blue
                                        : Colors
                                            .grey[400], // Icon color changes to blue when selected
                                size: 28,
                              ),
                              if (isSelected) const SizedBox(width: 6),
                              Text(
                                labels[index],
                                style: const TextStyle(
                                  color:
                                      Colors
                                          .grey, // Text color changes to blue when selected
                                  fontWeight: FontWeight.w600,
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
