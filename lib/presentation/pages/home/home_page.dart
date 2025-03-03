import 'package:auto_route/annotations.dart';
import 'package:calory_tool/presentation/pages/home/widget/card_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    int weekday = DateTime.now().weekday;
    DateTime beforeDay = DateTime.now().add(Duration(days: weekday -7));
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: AppValues.xl6.ext.padding.directional.top,
                child: const Text(
                  'Calorie Tracker',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final date = beforeDay.add(Duration(days: index));
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        label: Text(
                          DateFormat('dd MMM').format(date),
                          style: const TextStyle(fontSize: 16),
                        ),
                        backgroundColor:
                        date.ext.compare.isSameDay(currentdateTime)
                            ? Colors.blueAccent
                            : Colors.blueAccent.withOpacity(0.2),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              CardWidget(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SleekCircularSlider(
                        appearance: CircularSliderAppearance(),
                        onChange: (double value) {
                          print(value);
                        },
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          _buildSlider('Carb', Colors.orange, carb, 0, 500,
                                  (value) {
                                setState(() {
                                  carb = value;
                                });
                              }),
                          _buildSlider('Protein', Colors.green, protein, 0, 500,
                                  (value) {
                                setState(() {
                                  protein = value;
                                });
                              }),
                          _buildSlider('Fat', Colors.red, fat, 0, 500, (value) {
                            setState(() {
                              fat = value;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  CardWidget(
                    color: Colors.greenAccent,
                    child: Column(
                      children: [
                        Icon(Icons.breakfast_dining, size: 40),
                        Text('Kahvaltı: 500 kcal'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  CardWidget(
                    color: Colors.orangeAccent,
                    child: Column(
                      children: [
                        Icon(Icons.lunch_dining, size: 40),
                        Text('Öğle Yemeği: 700 kcal'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  CardWidget(
                    color: Colors.redAccent,
                    child: Column(
                      children: [
                        Icon(Icons.dinner_dining, size: 40),
                        Text('Akşam Yemeği: 800 kcal'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(
      String label, Color color, double value, double min, double max, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.toInt()}g',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).toInt(),
          activeColor: color,
          inactiveColor: color.withOpacity(0.3),
          label: '${value.toInt()}g',
          onChanged: onChanged,
        ),
      ],
    );
  }
}
