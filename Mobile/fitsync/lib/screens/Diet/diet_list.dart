import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/food/all_food.dart';
import 'package:fitsync/screens/Diet/filter_diet_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_saved_recipes.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../shared/widgets/global/custom_translate_text.dart';

class DietListScreen extends StatelessWidget {
  const DietListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: IconButton(
              onPressed: () {
                AnimatedNavigator().pop(context);
              },
              icon: const Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              )),
        ),
        title: customTranslateText(
          'Diet List',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: black3,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                AnimatedNavigator().push(
                  context,
                  const FilterDietScreen(),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      spreadRadius: 1,
                      color: gray4.withOpacity(0.08),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/Icons/filter_icon.png',
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 24),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * (388 / 428),
              height: MediaQuery.of(context).size.height * (55 / 926),
              child: TextFormField(
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 15),
                    hintText: "Search",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: gray4,
                    ),
                    prefixIcon: const Icon(
                      IconlyLight.search,
                      color: gray4,
                      size: 24,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: purple4, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gray3, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border:
                  )),
            ),
          ),
          FutureBuilder(
              future: AllFood().getAllFood(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<FoodModel> food = snapshot.data!;

                  return Expanded(
                    child: ListView.separated(
                      itemCount: food.length,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (context, index) => CustomSavedRecipesWidget(
                        imageUrl: "assets/images/Green Salad.jfif",
                        label1: food[index].Name.length > 20
                            ? food[index].Name.substring(0, 18)
                            : food[index].Name,
                        label2: "100% Healthy\nFits in Budget",
                      ),
                    ),
                  );
                } else {
                  return const Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ));
                }
              }),
        ],
      ),
    );
  }
}
