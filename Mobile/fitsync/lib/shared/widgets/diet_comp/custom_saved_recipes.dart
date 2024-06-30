import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/screens/Diet/meal_overview_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_ingredients_widget.dart';
import 'package:fitsync/shared/widgets/diet_comp/page2.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class CustomSavedRecipesWidget extends StatelessWidget {
  final String imageUrl;
  final String label1;
  final String label2;
  CustomSavedRecipesWidget({
    required this.diet,
    required this.imageUrl,
    required this.label1,
    required this.label2,
    super.key,
  });
  FoodModel diet;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Container(
        width: MediaQuery.of(context).size.width * (388 / 428),
        height: MediaQuery.of(context).size.height * (103 / 926),
        decoration: BoxDecoration(
            border: Border.all(
              color: gray9,
              width: 1,
            ),
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 3),
                color: black2.withOpacity(0.2),
              ),
            ]),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * (78 / 428),
              height: MediaQuery.of(context).size.height * (78 / 926),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  // width: 180,
                  child: Text(
                    label1,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 100,
                  child: Text(
                    label2,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: gray10),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyBold.heart,
                    color: purple5,
                    size: 20,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: InkWell(
                  onTap: () {
                    AnimatedNavigator().push(
                        context,
                        MealOverviewScreen(
                          diet: diet,
                        ));
                    weight = 0;
                    for (int i = 0; i < 100; i++) {
                      count1[i] = 0;
                    }
                    calories = 0;
                  },
                  child: Text(
                    'More Info',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: purple5),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
