import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({required this.image, required this.title, super.key});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          color: context.appThemeExt.appColors.white.byBrightness(
            context.ext.theme.isDark,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  height: 36,
                  child: Center(
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.ext.theme.textTheme.titleLarge?.copyWith(
                        color:
                            context.appThemeExt.appColors.white
                                .byBrightness(context.ext.theme.isDark)
                                .onColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              AppValues.sm.ext.sizedBox.vertical,
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
              ),
              AppValues.sm.ext.sizedBox.vertical,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    color:
                        context.appThemeExt.appColors.white
                            .byBrightness(context.ext.theme.isDark)
                            .onColor,
                    icon: const Icon(Icons.favorite_outline),
                  ),
                  SizedBox.square(
                    dimension: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            context.appThemeExt.appColors.secondary,
                        foregroundColor:
                            context.appThemeExt.appColors.secondary.onColor,
                        iconColor:
                            context.appThemeExt.appColors.secondary.onColor,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppValues.md.ext.radius.border.all,
                        ),
                      ),
                      child: const Center(child: Icon(Icons.arrow_forward_ios)),
                    ),
                  ),
                ],
              ),
              AppValues.sm.ext.sizedBox.vertical,
            ],
          ),
        ),
      ),
    );
  }
}
