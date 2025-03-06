import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
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
                      style: const TextStyle(
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
                        _expandedMeals = !_expandedMeals;
                      });
                    },
                    icon: Icon(
                      _expandedMeals
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              if (_expandedMeals)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
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
