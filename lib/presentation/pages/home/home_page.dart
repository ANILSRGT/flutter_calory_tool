import 'package:auto_route/annotations.dart';
import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/presentation/widgets/cards/card_widget.dart';
import 'package:calory_tool/presentation/widgets/cards/meal_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:penta_core/penta_core.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentdateTime = DateTime.now();
  double carb = 250;
  double protein = 150;
  double fat = 80;
  List<bool> expandedMeals = [false, false, false];

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
                  CardWidget(
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
                                context.appThemeExt.appColors.warning.light,
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
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Planed Meals',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              _buildMealSection(),
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

  final List<Map<String, dynamic>> meals = [
    {'name': 'Kahvaltı', 'image': 'assets/breakfast.png', 'calories': 400},
    {'name': 'Öğle Yemeği', 'image': 'assets/breakfast.png', 'calories': 600},
    {'name': 'Akşam Yemeği', 'image': 'assets/breakfast.png', 'calories': 500},
  ];

  Widget _buildMealSection() {
    return Column(
      children: List.generate(meals.length, (index) {
        final meal = meals[index];
        return MealCard(
          meal: meal['name'] as String,
          imagePath: meal['image'] as String,
          calories: meal['calories'] as int,
        );
      }),
    );
  }
}
