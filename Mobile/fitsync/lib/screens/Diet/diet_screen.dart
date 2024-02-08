import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/diet_plan_widget.dart';
import 'package:fitsync/shared/widgets/global/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Diet Plan",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: black3,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Follow your plan every day")),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  DietPlanWidget(
                    imageUrl: "assets/images/chicken.jfif",
                    text: "Chicken",
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  DietPlanWidget(
                    imageUrl: "assets/images/steak.jfif",
                    text: "Steak",
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  DietPlanWidget(
                    imageUrl: "assets/images/meat.jfif",
                    text: "Meat",
                  ),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "Popular Meals",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: black3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  DietPlanWidget(
                    imageUrl: "assets/images/Caesar Salad.jfif",
                    text: "Caesar Salad",
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  DietPlanWidget(
                    imageUrl: "assets/images/Garden Salad.jfif",
                    text: "Garden Salad",
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  DietPlanWidget(
                    imageUrl: "assets/images/Green Salad.jfif",
                    text: "Green Salad",
                  ),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "Saved Recipes",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: black3,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Text(
                      "View All",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: purple5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
