import 'package:calory_tool/data/models/foods/food_serving_model.dart';
import 'package:calory_tool/presentation/pages/food_detail_page/serving/serving_filter_sheet.dart';
import 'package:flutter/material.dart';

class Serving extends StatefulWidget {
  const Serving({super.key, required this.foodServingModel});

  final List<FoodServingModel> foodServingModel;

  @override
  State<Serving> createState() => _ServingState();
}

class _ServingState extends State<Serving> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Details action
                    },
                    child: Text(
                      'Show Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.filter_list_rounded,
                      color: Colors.green,
                      size: 28,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ServingFilterSheet();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
