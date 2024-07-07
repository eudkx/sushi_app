import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/colors.dart';
import 'package:sushi_app/menu_page.dart';

import 'food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final int index;
  const FoodTile({super.key, required this.food, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(12222);
        Provider.of<AllData>(context, listen: false).setNewCurrentIndex(index);
        Navigator.pushNamed(context, '/tilepage');
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // primaryColor,
                // Color.fromARGB(255, 193, 193, 193),
                // Color.fromARGB(255, 172, 172, 172),
                // Color.fromARGB(255, 157, 157, 157),
                primaryColor,
                primaryLighterColor
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // stops: [0.1, 1, 3, 4],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 172, 172, 172),
                  offset: Offset(0.8, 0.3),
                  spreadRadius: 0.1)
            ]),
        margin: const EdgeInsets.only(right: 25),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              food.imagePath,
              height: 150,
            ),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 21),
            ),
            const SizedBox(
              height: 5,
            ),
            // ),
            Row(
              children: [
                Text(
                  "${food.price.toString()}0\$",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  food.rating,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
