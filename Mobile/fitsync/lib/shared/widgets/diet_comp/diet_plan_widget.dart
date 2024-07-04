import 'package:fitsync/data/cubit/favourite_food/cubit/favourite_meal_cubit.dart';
import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/screens/Diet/meal_overview_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_ingredients_widget.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_saved_recipes.dart';
import 'package:fitsync/shared/widgets/diet_comp/page2.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class DietPlanWidget extends StatelessWidget {
  String imageUrl;
  String text;
  bool colorOfIcon;
  DietPlanWidget({
    required this.diet,
    required this.imageUrl,
    required this.text,
    required this.colorOfIcon,
    super.key,
  });
  FoodModel diet;
   //CustomSavedRecipesWidget colorIcon =CustomSavedRecipesWidget(diet: diet,label1: "",label2: "",);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AnimatedNavigator().push(
            context,
            MealOverviewScreen(
              diet: diet,
              iconColor: colorOfIcon,
             // iconColor:context.read<FavouriteMealCubit>().valueOfColor,
            ));
        weight = 0;
        for (int i = 0; i < 100; i++) {
          count1[i] = 0;
        }
        calories = 0;
      },
      child: Row(
        children: [
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (159 / 428),
                height: MediaQuery.of(context).size.height * (128 / 926),
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
