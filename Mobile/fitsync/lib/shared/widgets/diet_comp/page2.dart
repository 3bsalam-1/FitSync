import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_ingredients_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Ingredients That You \nWill Need",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: black2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 12),
              child: Text(
                '6 items',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: gray4,
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            CustomIngredientsWidget(
                imageUrl: "assets/images/Icons/Flour-Icon.png",
                label1: "Wheat Flour",
                label2: "100gr"),
            CustomIngredientsWidget(
                imageUrl: "assets/images/Icons/Sugar-Icon.png",
                label1: "Sugar",
                label2: "3 tbsp"),
            CustomIngredientsWidget(
                imageUrl: "assets/images/Icons/BakingSoda-Icon.png",
                label1: "Baking Soda",
                label2: "2 tsp"),
            CustomIngredientsWidget(
                imageUrl: "assets/images/Icons/Eggs-Icon.png",
                label1: "Eggs",
                label2: "2 items"),
          ],
        ),
      ],
    );
  }
}
