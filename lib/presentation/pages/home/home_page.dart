import 'package:auto_route/annotations.dart';
import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/providers/food_provider.dart';
import 'package:calory_tool/enum/planned_meals_enum.dart';
import 'package:calory_tool/presentation/pages/main/main_page.dart';
import 'package:calory_tool/presentation/widgets/cards/home_card.dart';
import 'package:calory_tool/presentation/widgets/cards/meal_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dateScrollController = ScrollController();
  DateTime currentdateTime = DateTime.now();
  double carb = 250;
  double protein = 150;
  double fat = 80;
  List<bool> expandedMeals = [false, false, false];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dateScrollController.jumpTo(
        _dateScrollController.position.maxScrollExtent,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final beforeDay = DateTime.now().subtract(const Duration(days: 6));

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  AppBar(
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    title: Text(
                      'Daily Meal Plan',
                      style: context.ext.theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      controller: _dateScrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        final date = beforeDay.add(Duration(days: index));
                        final isSelected = date.day == currentdateTime.day;
                        return GestureDetector(
                          onTap: () => setState(() => currentdateTime = date),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: 52,
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? context.appThemeExt.appColors.primary
                                      : context.appThemeExt.appColors.primary
                                          .withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('E').format(date),
                                  style: context.ext.theme.textTheme.bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            isSelected
                                                ? context
                                                    .appThemeExt
                                                    .appColors
                                                    .primary
                                                    .onColor
                                                : context
                                                    .appThemeExt
                                                    .appColors
                                                    .black
                                                    .byBrightness(
                                                      context.ext.theme.isDark,
                                                    ),
                                      ),
                                ),
                                Text(
                                  DateFormat('dd').format(date),
                                  style: context.ext.theme.textTheme.bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            isSelected
                                                ? context
                                                    .appThemeExt
                                                    .appColors
                                                    .primary
                                                    .onColor
                                                : context
                                                    .appThemeExt
                                                    .appColors
                                                    .black
                                                    .byBrightness(
                                                      context.ext.theme.isDark,
                                                    ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  HomeCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: SleekCircularSlider(
                            appearance: CircularSliderAppearance(
                              infoProperties: InfoProperties(
                                modifier:
                                    (percentage) =>
                                        percentage.ceil().toString(),
                                mainLabelStyle: context
                                    .ext
                                    .theme
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color:
                                          context.appThemeExt.appColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                bottomLabelText: 'KCAL LEFT',
                                bottomLabelStyle: context
                                    .ext
                                    .theme
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color:
                                          context.appThemeExt.appColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              customWidths: CustomSliderWidths(
                                trackWidth: 6,
                                progressBarWidth: 12,
                              ),
                              customColors: CustomSliderColors(
                                progressBarColors: [
                                  context.appThemeExt.appColors.primary,
                                  context.appThemeExt.appColors.primary,
                                ],
                                trackColor:
                                    context.appThemeExt.appColors.lightGrey,
                              ),
                              size: 180,
                            ),
                            initialValue: 1500,
                            max: 3000,
                            onChange: (double value) {},
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: AppValues.md.value,
                            children: [
                              buildStyledSlider(
                                'Carb',
                                context.appThemeExt.appColors.error.light,
                                carb,
                                0,
                                500,
                                (value) => setState(() => carb = value),
                              ),
                              buildStyledSlider(
                                'Protein',
                                context.appThemeExt.appColors.info.light,
                                protein,
                                0,
                                500,
                                (value) => setState(() => protein = value),
                              ),
                              buildStyledSlider(
                                'Fat',
                                context.appThemeExt.appColors.success.light,
                                fat,
                                0,
                                500,
                                (value) => setState(() => fat = value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Planed Meals',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    if (currentdateTime.toUtc().ext.compare.isSameDay(
                      DateTime.now().toUtc(),
                    ))
                      IconButton(
                        onPressed: () {
                          MainPage.pageController.animateToPage(
                            1,
                            duration: Durations.medium3,
                            curve: Curves.ease,
                          );
                        },
                        icon: CircleAvatar(
                          maxRadius: 16,
                          backgroundColor:
                              context.appThemeExt.appColors.primary,
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildMealSection(),
              Center(
                child: Html(
                  shrinkWrap: true,
                  data: '''
                  <a href="https://www.fatsecret.com">Powered by fatsecret</a>
                ''',
                  style: {
                    'a': Style(
                      color: Colors.blue,
                      fontSize: FontSize(16),
                      textAlign: TextAlign.center,
                    ),
                  },
                  onLinkTap: (url, attributes, element) {
                    launchUrl(
                      Uri.parse('https://www.fatsecret.com'),
                      mode: LaunchMode.inAppBrowserView,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStyledSlider(
    String label,
    Color color,
    double value,
    double min,
    double max,
    void Function(double) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.toInt()}g',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: color,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3,
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 6),
            activeTrackColor: color,
            thumbColor: color,
            overlayColor: color.withValues(alpha: 0.2),
            valueIndicatorShape: const HandleThumbShape(),
            valueIndicatorColor: color,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
            divisions: (max - min).toInt(),
            label: '${value.toInt()}g',
          ),
        ),
      ],
    );
  }

  Widget _buildMealSection() {
    final foodsCache = context
        .watch<FoodProvider>()
        .sevenDaysFoods
        .ext
        .where
        .firstOrNull(
          (e) => e.date.toUtc().ext.compare.isSameDay(currentdateTime.toUtc()),
        );
    return Column(
      spacing: 10,
      children:
          PlannedMealsEnum.values
              .map(
                (e) => MealCard(
                  meal: e.displayName,
                  imagePath: 'assets/breakfast.png',
                  foods: foodsCache?.foodEntries[e] ?? [],
                ),
              )
              .toList(),
    );
  }
}
