import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class RecipeCard extends StatelessWidget {
  final String image;
  final String title;

  RecipeCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF6DBE89),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0,left: 10.0,right: 10.0),
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey.shade400, thickness:1),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Divider(color: Colors.grey.shade400, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.favorite,color: Colors.white,)),
                  SizedBox.square(
                    dimension: 45,
                    child: ElevatedButton(onPressed: () {

                    },style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: AppValues.md.ext.radius.border.all)
                    ), child:  Center(child: Icon(Icons.arrow_forward_ios,color: Colors.white,))),
                  )
                ],
              )



            ],
          ),
        ),
      ));

  }
}