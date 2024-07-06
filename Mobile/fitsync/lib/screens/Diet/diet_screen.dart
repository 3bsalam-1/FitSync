import 'package:fitsync/cubits_logic/diet_logic/drop_down_button/cubit/drop_down_button_cubit.dart';
import 'package:fitsync/data/cubit/favourite_food/cubit/favourite_meal_cubit.dart';
import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/food/all_food.dart';
import 'package:fitsync/data/repository/food/favourite_food.dart';
import 'package:fitsync/data/repository/food/food_repo.dart';
import 'package:fitsync/screens/Diet/diet_list.dart';
import 'package:fitsync/screens/Diet/empty_state_screen.dart';
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

class DietScreen extends StatelessWidget {
  DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteMealCubit>(context);
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
                    child: Text(
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
                  child: Text(
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
                          itemBuilder: (context, index) {
                            String displayName = food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&");
                            if (displayName.length > 12) {
                              displayName =
                                  displayName.substring(0, 12) + '...';
                            }

                            return DietPlanWidget(
                              diet: food[index],
                              imageUrl:
                                  "assets/images/diet/diet/${food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                              text: displayName,
                              colorOfIcon: cubit.isFavoriteMeal(food[index]),
                            );
                          }),
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
                            Text(
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
                              items: [
                                "Vegetables",
                                "Fruits",
                                "Grains",
                                "Legumes",
                                "Protein Foods"
                              ]
                                  .map((e) => DropdownMenuItem(
                                      child: Text(
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
                          future: AllFood().getAllFood(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<FoodModel> food = snapshot.data!;
                              int i = 1;
                              food = food
                                  .where((item) =>
                                      item.Catagory.toLowerCase()
                                          .contains("chilli".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("broccoli".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("tomato".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("potato".toLowerCase()))
                                  .toList();
                              return SizedBox(
                                height: 140,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: food.length,
                                    physics: const BouncingScrollPhysics(),
                                    // separatorBuilder: (context, index) => const SizedBox(height: 25),
                                    itemBuilder: (context, index) {
                                      String displayName = food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&");
                                      if (displayName.length > 12) {
                                        displayName =
                                            displayName.substring(0, 12) +
                                                '...';
                                      }
                                      return DietPlanWidget(
                                        diet: food[index],
                                        imageUrl:
                                            "assets/images/diet/diet/${food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                                        text: displayName,
                                        colorOfIcon: cubit.isFavoriteMeal(food[index]),
                                      );
                                    }),
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
                    if (context.read<DropDownButtonCubit>().selectedItem ==
                        "Fruits")
                      FutureBuilder(
                          future: AllFood().getAllFood(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<FoodModel> food = snapshot.data!;
                              int i = 1;
                              food = food
                                  .where((item) =>
                                      item.Catagory.toLowerCase().contains(
                                          "strawberry".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("mango".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("apple".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("banana".toLowerCase()))
                                  .toList();
                              return SizedBox(
                                height: 140,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: food.length,
                                    physics: const BouncingScrollPhysics(),
                                    // separatorBuilder: (context, index) => const SizedBox(height: 25),
                                    itemBuilder: (context, index) {
                                      String displayName = food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&");
                                      if (displayName.length > 12) {
                                        displayName =
                                            displayName.substring(0, 12) +
                                                '...';
                                      }
                                      return DietPlanWidget(
                                        diet: food[index],
                                        imageUrl:
                                            "assets/images/diet/diet/${food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                                        text: displayName,
                                        colorOfIcon: cubit.isFavoriteMeal(food[index]),
                                      );
                                    }),
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
                    if (context.read<DropDownButtonCubit>().selectedItem ==
                        "Grains")
                      FutureBuilder(
                          future: AllFood().getAllFood(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<FoodModel> food = snapshot.data!;
                              int i = 1;
                              food = food
                                  .where((item) =>
                                      item.Catagory.toLowerCase()
                                          .contains("poha".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("rice".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("bread".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("khichdi".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("corn".toLowerCase()))
                                  .toList();
                              return SizedBox(
                                height: 140,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: food.length,
                                    physics: const BouncingScrollPhysics(),
                                    // separatorBuilder: (context, index) => const SizedBox(height: 25),
                                    itemBuilder: (context, index) {
                                      String displayName = food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&");
                                      if (displayName.length > 12) {
                                        displayName =
                                            displayName.substring(0, 12) +
                                                '...';
                                      }

                                      return DietPlanWidget(
                                        diet: food[index],
                                        imageUrl:
                                            "assets/images/diet/diet/${food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                                        text: displayName,
                                        colorOfIcon: cubit.isFavoriteMeal(food[index]),
                                      );
                                    }),
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
                    if (context.read<DropDownButtonCubit>().selectedItem ==
                        "Legumes")
                      FutureBuilder(
                          future: AllFood().getAllFood(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<FoodModel> food = snapshot.data!;
                              int i = 1;
                              food = food
                                  .where((item) => item.Catagory.toLowerCase()
                                      .contains("dal".toLowerCase()))
                                  .toList();
                              return SizedBox(
                                height: 140,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: food.length,
                                    physics: const BouncingScrollPhysics(),
                                    // separatorBuilder: (context, index) => const SizedBox(height: 25),
                                    itemBuilder: (context, index) {
                                      String displayName = food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&");
                                      if (displayName.length > 12) {
                                        displayName =
                                            displayName.substring(0, 12) +
                                                '...';
                                      }
                                      return DietPlanWidget(
                                        diet: food[index],
                                        imageUrl:
                                            "assets/images/diet/diet/${food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                                        text: displayName,
                                        colorOfIcon: cubit.isFavoriteMeal(food[index]),
                                      );
                                    }),
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
                    if (context.read<DropDownButtonCubit>().selectedItem ==
                        "Protein Foods")
                      FutureBuilder(
                          future: AllFood().getAllFood(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<FoodModel> food = snapshot.data!;

                              food = food
                                  .where((item) =>
                                      item.Catagory.toLowerCase()
                                          .contains("egg".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("kofta".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("chicken".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("fish".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("milk".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("kebabs".toLowerCase()) ||
                                      item.Catagory.toLowerCase()
                                          .contains("tikka".toLowerCase()))
                                  .toList();
                              return SizedBox(
                                height: 140,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: food.length,
                                    physics: const BouncingScrollPhysics(),
                                    // separatorBuilder: (context, index) => const SizedBox(height: 25),
                                    itemBuilder: (context, index) {
                                      String displayName = food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&");
                                      if (displayName.length > 12) {
                                        displayName =
                                            displayName.substring(0, 12) +
                                                '...';
                                      }
                                      return DietPlanWidget(
                                        diet: food[index],
                                        imageUrl:
                                            "assets/images/diet/diet/${food[index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                                        text: displayName,
                                        colorOfIcon: cubit.isFavoriteMeal(food[index]),
                                      );
                                    }),
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
                  padding: const EdgeInsets.only(left: 18, top: 16, bottom: 10),
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
                  onTap: () {
                    // if (context.read<FavouriteMealCubit>().isData())
                    //   AnimatedNavigator().push(context, EmptyStateScreen());
                    // else
                    AnimatedNavigator().push(context, SavedRecipesScreen());
                  },
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
            BlocConsumer<FavouriteMealCubit, FavouriteMealState>(
                listener: (context, state) {
              // TODO: implement listener
            }, builder: (context, state) {
              if (context.read<FavouriteMealCubit>().isData()) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Text("There is no Saved Recipes",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: black3,
                        ),
                      )),
                ));
              } else {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.favoriteMeals!.length >= 3
                          ? 3
                          : cubit.favoriteMeals!.length,
                      physics: const BouncingScrollPhysics(),
                      //  separatorBuilder: (context, index) =>
                      //  const SizedBox(width: 15),
                      itemBuilder: (context, index) {
                        String displayName = cubit.favoriteMeals![index].Name.replaceAll("/", "").replaceAll("&amp;", "&");
                        if (displayName.length > 12) {
                          displayName = displayName.substring(0, 12) + '...';
                        }
                        return SavedRecipesWidget(
                            diet: cubit.favoriteMeals![index],
                            imageUrl:
                                "assets/images/diet/diet/${cubit.favoriteMeals![index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                            label1: displayName,
                            label2: "Healthy\nFits in Budget",
                            onPressed: () {
                              cubit.removefoodfromfavorites(
                                  meals: cubit.favoriteMeals![index]);
                                 
                            });
                      }),
                );
              }
            }),
            SizedBox(
              width: 15,
            ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 18,
            //       ),
            //       SavedRecipesWidget(
            //         imageUrl: 'assets/images/steak.jfif',
            //         label1: 'Steak',
            //         label2: '88% Healthy\nFits in Budget',
            //       ),
            //       SizedBox(
            //         width: 18,
            //       ),
            //       SavedRecipesWidget(
            //         imageUrl: 'assets/images/Egg Salad.jfif',
            //         label1: 'Egg Salad',
            //         label2: '99% Healthy\nFits in Budget',
            //       ),
            //       SizedBox(
            //         width: 18,
            //       ),
            //       SavedRecipesWidget(
            //         imageUrl: 'assets/images/Caesar Salad.jfif',
            //         label1: 'Caesar Salad',
            //         label2: '92% Healthy\nFits in Budget',
            //       ),
            //       SizedBox(
            //         width: 18,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
