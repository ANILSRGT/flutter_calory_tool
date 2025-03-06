part of '../recipe_details_page_imports.dart';

class _RecipeDetailsPageBody extends StatelessWidget {
  const _RecipeDetailsPageBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppValues.md.ext.padding.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(title: const Text('Recipe #'), centerTitle: true),
              CardWidget(
                elevation: 3,
                color: context.appThemeExt.appColors.white.byBrightness(
                  context.ext.theme.isDark,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/breakfast.png',
                      width: context.ext.screen.byOrientation(
                        portrait: context.ext.screen.width * 0.5,
                        landscape: context.ext.screen.height * 0.5,
                      ),
                      height: context.ext.screen.byOrientation(
                        portrait: context.ext.screen.width * 0.5,
                        landscape: context.ext.screen.height * 0.5,
                      ),
                      fit: BoxFit.contain,
                    ),
                    AppValues.md.ext.sizedBox.vertical,
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: AppValues.sm.value,
                      children: List.generate(3, (index) {
                        return Chip(label: Text('Card $index'));
                      }),
                    ),
                    AppValues.md.ext.sizedBox.vertical,
                    Text(
                      'Pariatur veniam do laborum proident. Reprehenderit minim veniam culpa aute ut. Occaecat eiusmod est pariatur id. Id ex officia ad ea est labore irure do qui qui. Nisi culpa adipisicing et est mollit consequat excepteur. Nostrud sit do magna aliqua.',
                      textAlign: TextAlign.center,
                      style: context.ext.theme.textTheme.bodyLarge?.copyWith(
                        color:
                            context.appThemeExt.appColors.white
                                .byBrightness(context.ext.theme.isDark)
                                .onColor,
                      ),
                    ),
                  ],
                ),
              ),
              AppValues.md.ext.sizedBox.vertical,
              CardWidget(
                elevation: 3,
                color: context.appThemeExt.appColors.white.byBrightness(
                  context.ext.theme.isDark,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Ingredients',
                      style: context.ext.theme.textTheme.titleLarge?.copyWith(
                        color:
                            context.appThemeExt.appColors.white
                                .byBrightness(context.ext.theme.isDark)
                                .onColor,
                      ),
                    ),
                    Padding(
                      padding: AppValues.sm.ext.padding.horizontal,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Text(
                            '• Ingredient $index',
                            style: context.ext.theme.textTheme.bodyLarge
                                ?.copyWith(
                                  color:
                                      context.appThemeExt.appColors.white
                                          .byBrightness(
                                            context.ext.theme.isDark,
                                          )
                                          .onColor,
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              AppValues.md.ext.sizedBox.vertical,
              CardWidget(
                elevation: 3,
                color: context.appThemeExt.appColors.white.byBrightness(
                  context.ext.theme.isDark,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Nutrition',
                      style: context.ext.theme.textTheme.titleLarge?.copyWith(
                        color:
                            context.appThemeExt.appColors.white
                                .byBrightness(context.ext.theme.isDark)
                                .onColor,
                      ),
                    ),
                    Padding(
                      padding: AppValues.sm.ext.padding.horizontal,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text(
                                '• Nutrition $index',
                                style: context.ext.theme.textTheme.bodyLarge
                                    ?.copyWith(
                                      color:
                                          context.appThemeExt.appColors.white
                                              .byBrightness(
                                                context.ext.theme.isDark,
                                              )
                                              .onColor,
                                    ),
                              ),
                              Text(
                                'Value $index',
                                style: context.ext.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                      color:
                                          context.appThemeExt.appColors.white
                                              .byBrightness(
                                                context.ext.theme.isDark,
                                              )
                                              .onColor,
                                    ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
