import 'package:fitsync/cubits_logic/diet_logic/drop_down_button/cubit/drop_down_button_cubit.dart';
import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/food/food_repo.dart';
import 'package:fitsync/screens/Diet/diet_list.dart';
import 'package:fitsync/screens/Diet/saved_recipes_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/diet_plan_widget.dart';
import 'package:fitsync/shared/widgets/diet_comp/saved_recipes_widget.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../shared/widgets/global/custom_translate_text.dart';

class DietScreen extends StatelessWidget {
  DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: customTranslateText(
                      "Diet Plan",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: black3,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 10),
                  child: IconButton(
                    icon: const Icon(
                      Icons.format_align_left_sharp,
                      color: purple2,
                    ),
                    onPressed: () {
                      AnimatedNavigator().push(context, DietListScreen());
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: customTranslateText(
                    "Follow your plan every day",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: gray3,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: FoodPlan().getFoodPlan(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<FoodModel> food = snapshot.data!;

                    return SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: food.length,
                        physics: const BouncingScrollPhysics(),
                        // separatorBuilder: (context, index) => const SizedBox(height: 25),
                        itemBuilder: (context, index) => DietPlanWidget(
                          diet: food[index],
                          imageUrl: "assets/images/chicken.jfif",
                          text: food[index].Catagory,
                        ),
                      ),
                    );
                  } else {
                    return  Column(
                      children: [
                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customTranslateText(
                              "your plan is loading ...  ",
                              style: TextStyle(fontSize: 18),
                            ),
                            CircularProgressIndicator(),
                          ],
                        ),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    );
                  }
                }),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 18,
            //       ),
            //       DietPlanWidget(
            //         imageUrl: "assets/images/chicken.jfif",
            //         text: "Chicken",
            //       ),
            //       SizedBox(
            //         width: 18,
            //       ),
            //       DietPlanWidget(
            //         imageUrl: "assets/images/steak.jfif",
            //         text: "Steak",
            //       ),
            //       SizedBox(
            //         width: 18,
            //       ),
            //       DietPlanWidget(
            //         imageUrl: "assets/images/meat.jfif",
            //         text: "Meat",
            //       ),
            //       SizedBox(
            //         width: 18,
            //       ),
            //     ],
            //   ),
            // ),

            BlocBuilder<DropDownButtonCubit, DropDownButtonState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 30, bottom: 25),
                          child: customTranslateText(
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
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, bottom: 25, right: 20),
                          child: Container(
                            height:
                                MediaQuery.of(context).size.height * (32 / 926),
                            //width: MediaQuery.of(context).size.width * (113 / 428),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: purple5),

                            child: DropdownButton(
                              items: ["Vegetables", "Fruits", "grains", "meat"]
                                  .map((e) => DropdownMenuItem(
                                      child: customTranslateText(
                                        "${e}",
                                        style: TextStyle(),
                                      ),
                                      value: e))
                                  .toList(),
                              onChanged: (val) {
                                context
                                    .read<DropDownButtonCubit>()
                                    .selectedItem = val!;
                                context
                                    .read<DropDownButtonCubit>()
                                    .onChanged_function();
                              },
                              value: context
                                  .read<DropDownButtonCubit>()
                                  .selectedItem,
                              icon: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    IconlyLight.arrow_down_2,
                                    color: white,
                                    size: 15,
                                  ),
                                ],
                              ),
                              style: GoogleFonts.poppins(
                                  color: white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              padding:
                                  EdgeInsets.only(left: 6, right: 6, top: 1),
                              isDense: true,
                              underline: VerticalDivider(
                                thickness: 0,
                              ),
                              dropdownColor: purple5,
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (context.read<DropDownButtonCubit>().selectedItem ==
                        "Vegetables")
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       SizedBox(
                      //         width: 18,
                      //       ),
                      //       // DietPlanWidget(
                      //       //   imageUrl: "assets/images/Caesar Salad.jfif",
                      //       //   text: "Caesar Salad",
                      //       // ),
                      //       SizedBox(
                      //         width: 18,
                      //       ),
                      //       // DietPlanWidget(
                      //       //   imageUrl: "assets/images/Garden Salad.jfif",
                      //       //   text: "Garden Salad",
                      //       // ),
                      //       SizedBox(
                      //         width: 18,
                      //       ),
                      //       // DietPlanWidget(
                      //       //   imageUrl: "assets/images/Green Salad.jfif",
                      //       //   text: "Green Salad",
                      //       // ),
                      //       SizedBox(
                      //         width: 18,
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      FutureBuilder(
                          future: FoodPlan().getFoodPlan(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<FoodModel> food = snapshot.data!;

                              return SizedBox(
                                height: 140,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: food.length,
                                  physics: const BouncingScrollPhysics(),
                                  // separatorBuilder: (context, index) => const SizedBox(height: 25),
                                  itemBuilder: (context, index) =>
                                      DietPlanWidget(
                                    diet: food[index],
                                    imageUrl: "assets/images/chicken.jfif",
                                    text: food[index].Catagory,
                                  ),
                                ),
                              );
                            } else {
                              return const Column(
                                children: [
                                  SizedBox(
                                    height: 45,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 45,
                                  ),
                                ],
                              );
                            }
                          }),
                  ],
                );
              },
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 30, bottom: 20),
                  child: customTranslateText(
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
                  onTap: () {
                    AnimatedNavigator().push(context, SavedRecipesScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: customTranslateText(
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  SavedRecipesWidget(
                    imageUrl: 'assets/images/steak.jfif',
                    label1: 'Steak',
                    label2: '88% Healthy\nFits in Budget',
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  SavedRecipesWidget(
                    imageUrl: 'assets/images/Egg Salad.jfif',
                    label1: 'Egg Salad',
                    label2: '99% Healthy\nFits in Budget',
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  SavedRecipesWidget(
                    imageUrl: 'assets/images/Caesar Salad.jfif',
                    label1: 'Caesar Salad',
                    label2: '92% Healthy\nFits in Budget',
                  ),
                  SizedBox(
                    width: 18,
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
