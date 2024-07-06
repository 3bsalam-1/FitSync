import 'package:fitsync/cubits_logic/diet_logic/counter/counter_cubit.dart';
import 'package:fitsync/cubits_logic/diet_logic/for_weight/cubit/changestate_cubit.dart';
import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/food/all_calories.dart';
import 'package:fitsync/screens/Diet/diet_screen.dart';
import 'package:fitsync/screens/Home/home_screen.dart';
import 'package:fitsync/screens/home_main_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_ingredients_widget.dart';
import 'package:fitsync/shared/widgets/diet_comp/meal_tracker_widget.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/global/custom_translate_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

int totalIntakeCalories = 0;

class Page1 extends StatelessWidget {
  Page1({
    required this.diet,
    super.key,
  });
  FoodModel diet;

  bool addmeal = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ChangestateCubit, ChangestateState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MealTrackerWidget(
                        imageUrl: "assets/images/Icons/weight.png",
                        width: 30,
                        height: 30,
                        h: 0,
                        label1: 'Weight',
                        label2: "${weight} ",
                        label3: 'gm',
                        size: 14,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 0,
                      child: const VerticalDivider(
                        thickness: 2,
                        color: gray12,
                        width: 80,
                        indent: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 0),
                      child: MealTrackerWidget(
                        imageUrl: "assets/images/Icons/Calories.png",
                        width: 18,
                        height: 26,
                        h: 0,
                        label1: 'Calories',
                        label2: '${context.read<ChangestateCubit>().change()} ',
                        label3: 'cals',
                        size: 14,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 0,
                      child: const VerticalDivider(
                        thickness: 2,
                        color: gray12,
                        width: 80,
                        indent: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 2),
                      child: MealTrackerWidget(
                        imageUrl: "assets/images/Icons/diet.png",
                        width: 24,
                        height: 24,
                        h: 2,
                        label1: 'Diet',
                        label2: diet.Diet.substring(0, 10) + "..",
                        label3: '',
                        size: 11,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 0,
                      child: const VerticalDivider(
                        thickness: 2,
                        color: gray12,
                        width: 80,
                        indent: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 6),
                      child: MealTrackerWidget(
                        imageUrl: "assets/images/Icons/nutrient.png",
                        width: 24,
                        height: 24,
                        h: 0,
                        label1: 'Nutrient',
                        label2: diet.Nutrient,
                        label3: '',
                        size: 9.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                // Container(
                //     width: MediaQuery.sizeOf(context).width * 0.36,
                //     height: 35,
                //     decoration: BoxDecoration(
                //       color: purple5,
                //       borderRadius: BorderRadius.circular(60),
                //     ),
                //     child: BlocBuilder<CounterCubit, CounterState>(
                //       builder: (context, state) {
                //         return Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             IconButton(
                //               onPressed: () {
                //                 if (context.read<CounterCubit>().index >= 1) {
                //                   context.read<CounterCubit>().index--;
                //                   context.read<CounterCubit>().ontap();
                //                 }
                //               },
                //               icon: const Icon(
                //                 Icons.remove,
                //                 color: white,
                //                 size: 15,
                //               ),
                //             ),
                //             customTranslatecustomTranslateText(
                //               (context.read<CounterCubit>().index).toString(),
                //               style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 18,
                //                 color: white,
                //               ),
                //               textAlign: TextAlign.center,
                //             ),
                //             IconButton(
                //               onPressed: () {
                //                 context.read<CounterCubit>().index++;
                //                 context.read<CounterCubit>().ontap();
                //               },
                //               icon: const Icon(
                //                 Icons.add,
                //                 color: white,
                //                 size: 15,
                //               ),
                //             ),
                //           ],
                //         );
                //       },
                //     )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                CustomButton(
                    label: 'Add Meal',
                    onPressed: () {
                      if ((totalDailyCalories.round() -
                              (totalIntakeCalories)) >=
                          0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: customTranslateText(
                                  "Are you sure ?",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                content: customTranslateText(
                                  "when adding this meal your remaining calories will be ${(totalDailyCalories.round() - (totalIntakeCalories + calories)) >= 0 ? totalDailyCalories.round() - (totalIntakeCalories + calories) : 0} cals while your total daily calories = ${totalDailyCalories.round()} cals",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                                purple9),
                                        shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)))),
                                    child: customTranslateText(
                                      "No",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                                purple9),
                                        shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)))),
                                    child: customTranslateText(
                                      "Yes",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                    ),
                                    onPressed: () {
                                      totalIntakeCalories += calories;
                                      AnimatedNavigator()
                                          .push(context, HomeMainScreen());
                                    },
                                  ),
                                ],
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: customTranslateText(
                                  "Are you sure ?",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                content: customTranslateText(
                                  "you finish all calories for today !",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                                purple9),
                                        shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)))),
                                    child: customTranslateText(
                                      "No",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                                purple9),
                                        shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)))),
                                    child: customTranslateText(
                                      "Yes",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                    ),
                                    onPressed: () {
                                      totalIntakeCalories += calories;
                                      AnimatedNavigator()
                                          .push(context, HomeMainScreen());
                                    },
                                  ),
                                ],
                              );
                            });
                      }

                      //addmeal = true;
                      //context.read<ChangestateCubit>().change();
                      // print(AllCalories().getAllCalories());

                      //  print(totalIntakeCalories);
                      //print("object${totalDailyCalories}");
                    })
              ],
            );
          },
        ),
      ],
    );
  }
}
