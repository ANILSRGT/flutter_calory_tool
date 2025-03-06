import 'package:auto_route/annotations.dart';
import 'package:calory_tool/presentation/pages/home/widget/card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
    DateTime beforeDay = DateTime.now().subtract(Duration(days: 6));

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[50],
                ),
                child: Column(
                  children: [
                    AppBar(
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: true,
                      title: const Text(
                        'Daily Meal Plan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          final date = beforeDay.add(Duration(days: index));
                          bool isSelected = date.day == currentdateTime.day;
                          return GestureDetector(
                            onTap: () => setState(() => currentdateTime = date),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                              ),
                              width: 52,
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? Colors.blueAccent
                                        : Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('E').format(date),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd').format(date),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.black87,
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
                      color: Colors.blueGrey[50],
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SleekCircularSlider(
                                      appearance: CircularSliderAppearance(
                                        customWidths: CustomSliderWidths(
                                          trackWidth: 6,
                                          progressBarWidth: 12,
                                        ),
                                        customColors: CustomSliderColors(
                                          progressBarColors: [
                                            Colors.blue,
                                            Colors.blueAccent,
                                          ],
                                          trackColor: Colors.grey.shade300,
                                        ),
                                        size: 180,
                                      ),
                                      initialValue: 1500,
                                      min: 0,
                                      max: 3000,
                                      onChange: (double value) {},
                                    ),
                                    Positioned(
                                      top: 140,
                                      child: Text(
                                        'KCAL LEFT',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  spacing: AppValues.md.value,
                                  children: [
                                    buildStyledSlider(
                                      'Carb',
                                      Colors.red,
                                      carb,
                                      0,
                                      500,
                                      (value) => setState(() => carb = value),
                                    ),
                                    buildStyledSlider(
                                      'Protein',
                                      Colors.teal,
                                      protein,
                                      0,
                                      500,
                                      (value) =>
                                          setState(() => protein = value),
                                    ),
                                    buildStyledSlider(
                                      'Fat',
                                      Colors.purple,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Planed Meals',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
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
    Function(double) onChanged,
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
            overlayShape: RoundSliderOverlayShape(overlayRadius: 6),
            activeTrackColor: color,
            thumbColor: color,
            overlayColor: color.withValues(alpha: 0.2),
            valueIndicatorShape: HandleThumbShape(),
            valueIndicatorColor: color,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
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
        return _buildMealCard(
          meal['name'] as String,
          meal['image'] as String,
          meal['calories'] as int,
          index,
        );
      }),
    );
  }

  Widget _buildMealCard(
    String meal,
    String imagePath,
    int calories,
    int index,
  ) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      '$meal: $calories kcal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        expandedMeals[index] = !expandedMeals[index];
                      });
                    },
                    icon: Icon(
                      expandedMeals[index]
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                        child: const Icon(Icons.add, color: Colors.white)),
                  ),
                ],
              ),
              if (expandedMeals[index])
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Carb:10gr'),
                        Text('Yağ:10gr'),
                        Text('Protein:10gr'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
