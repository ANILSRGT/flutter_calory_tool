import 'package:auto_route/annotations.dart';
import 'package:calory_tool/core/widgets/navBar/nav_bar_widget.dart';
import 'package:calory_tool/presentation/pages/home/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  @override
  Widget build(BuildContext context) {
    int weekday = DateTime.now().weekday;
    DateTime beforeDay = DateTime.now().subtract(Duration(days: weekday - 1));

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  'Calorie Tracker',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final date = beforeDay.add(Duration(days: index));
                    bool isSelected = date.day == currentdateTime.day;
                    return GestureDetector(
                      onTap: () => setState(() => currentdateTime = date),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 6.0),
                        width: 55,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blueAccent : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 4, offset: const Offset(0, 2)),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('E').format(date),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black54,
                              ),
                            ),
                            Text(
                              DateFormat('dd').format(date),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black87,
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
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(trackWidth: 6, progressBarWidth: 12),
                        size: 150,
                        customColors: CustomSliderColors(
                          progressBarColors: [Colors.blue, Colors.blueAccent],
                          trackColor: Colors.grey.shade300,
                        ),
                      ),
                      initialValue: 1500,
                      min: 0,
                      max: 3000,
                      onChange: (double value) {},
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSlider('Carb', Colors.orange, carb, 0, 500, (value) => setState(() => carb = value)),
                        _buildSlider('Protein', Colors.green, protein, 0, 500, (value) => setState(() => protein = value)),
                        _buildSlider('Fat', Colors.red, fat, 0, 500, (value) => setState(() => fat = value)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              _buildMealSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(String label, Color color, double value, double min, double max, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.toInt()}g', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Slider(
          value: value,
          min: min,
          max: max,
          activeColor: color,
          inactiveColor: color.withValues(alpha: 0.3),
          label: '${value.toInt()},',
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildMealSection() {
    final meals = [
      {'name': 'Kahvaltı', 'icon': Icons.breakfast_dining, 'calories': 400},
      {'name': 'Öğle Yemeği', 'icon': Icons.lunch_dining, 'calories': 600},
      {'name': 'Akşam Yemeği', 'icon': Icons.dinner_dining, 'calories': 500},
    ];

    return CardWidget(
      color: Colors.white,
      child: Column(
        children: meals.map((meal) => _buildMealCard(meal['name'] as String, meal['icon'] as IconData, meal['calories'] as int)).toList(),
      ),
    );
  }

  Widget _buildMealCard(String meal, IconData icon, int calories) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          Row(
            children: [
              Text('$meal: $calories kcal', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
