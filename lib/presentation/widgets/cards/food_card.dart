import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/router/app_router.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
   required this.foodModel
  });

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push( FoodDetailRoute(foodModel: foodModel));
      },
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: context.appThemeExt.appColors.background.byBrightness(
          context.ext.theme.isDark,
        ),
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.black.withValues(alpha: 0.8),
        elevation: 4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 4),
                child: Transform.translate(
                  offset: const Offset(0, -45),
                  child: Image.asset(
                    'assets/breakfast.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodModel.name?? 'N/A',
                      style: context.ext.theme.textTheme.titleLarge?.copyWith(
                        color: context.appThemeExt.appColors.background
                            .byBrightness(context.ext.theme.isDark)
                            .onColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

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
