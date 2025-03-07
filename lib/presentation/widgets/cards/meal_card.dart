import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class MealCard extends StatefulWidget {
  const MealCard({
    required this.meal,
    required this.imagePath,
    required this.calories,
    super.key,
  });

  final String meal;
  final String imagePath;
  final int calories;

  @override
  State<MealCard> createState() => MealCardState();
}

class MealCardState extends State<MealCard> {
  bool _expandedMeals = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: context.appThemeExt.appColors.white.byBrightness(
            context.ext.theme.isDark,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _expandedMeals = !_expandedMeals;
                });
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      '${widget.meal}: ${widget.calories} kcal',
                      style: context.ext.theme.textTheme.titleMedium!.copyWith(
                        color:
                            context.appThemeExt.appColors.white
                                .byBrightness(context.ext.theme.isDark)
                                .onColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    _expandedMeals ? Icons.arrow_upward : Icons.arrow_downward,
                  ),
                ],
              ),
            ),
            if (_expandedMeals)
              Padding(
                padding: AppValues.sm.ext.padding.directional.top,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Carb:10gr',
                        style: context.ext.theme.textTheme.bodyLarge!.copyWith(
                          color:
                              context.appThemeExt.appColors.white
                                  .byBrightness(context.ext.theme.isDark)
                                  .onColor,
                        ),
                      ),
                      Text(
                        'Yağ:10gr',
                        style: context.ext.theme.textTheme.bodyLarge!.copyWith(
                          color:
                              context.appThemeExt.appColors.white
                                  .byBrightness(context.ext.theme.isDark)
                                  .onColor,
                        ),
                      ),
                      Text(
                        'Protein:10gr',
                        style: context.ext.theme.textTheme.bodyLarge!.copyWith(
                          color:
                              context.appThemeExt.appColors.white
                                  .byBrightness(context.ext.theme.isDark)
                                  .onColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
