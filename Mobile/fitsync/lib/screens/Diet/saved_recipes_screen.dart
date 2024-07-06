import 'package:fitsync/data/cubit/favourite_food/cubit/favourite_meal_cubit.dart';
import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/food/favourite_food.dart';
import 'package:fitsync/screens/Diet/diet_list.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_saved_recipes.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/global/custom_translate_text.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/survey_comp/choices_comp/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

bool find = false;

class SavedRecipesScreen extends StatelessWidget {
  SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteMealCubit>(context);
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
              icon: Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              )),
        ),
        title: customTranslateText(
          'Saved Recipes',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: black3,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: UserWidget(),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),

          BlocConsumer<FavouriteMealCubit, FavouriteMealState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (context.read<FavouriteMealCubit>().isData()) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          'assets/images/empty state image.png',
                          width:
                              MediaQuery.of(context).size.width * (322 / 428),
                          height:
                              MediaQuery.of(context).size.height * (430 / 926),
                        ),
                        customTranslateText(
                          ' Your Saved Recipes is\nempty you can discover\n   latest Recipes now',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: gray6,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    CustomButton(
                      label: "Recipes",
                      onPressed: () {
                        AnimatedNavigator().push(context, DietListScreen());
                      },
                    ),
                  ],
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemCount: cubit.favoriteMeals!.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (context, index) => CustomSavedRecipesWidget(
                      diet: cubit.favoriteMeals![index],
                      imageUrl:
                          "assets/images/diet/diet/${cubit.favoriteMeals![index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                      label1: cubit.favoriteMeals![index].Name.replaceAll("/", "").replaceAll("&amp;", "&").length > 20
                          ? cubit.favoriteMeals![index].Name.replaceAll("/", "").replaceAll("&amp;", "&").substring(0, 18) +
                              "..."
                          : cubit.favoriteMeals![index].Name.replaceAll("/", "").replaceAll("&amp;", "&"),
                      label2: "Healthy\nFits in Budget",
                      onPressed: () {
                        cubit.removefoodfromfavorites(
                            meals: cubit.favoriteMeals![index]);
                      },
                      iconColor: true,
                    ),
                  ),
                );
              }
            },
          ),

          // CustomSavedRecipesWidget(
          //   diet: ,
          //   imageUrl: "assets/images/Green Salad.jfif",
          //   label1: 'Green Salad',
          //   label2: "100% Healthy\nFits in Budget",
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // CustomSavedRecipesWidget(
          //   imageUrl: "assets/images/Egg Sandwich.jfif",
          //   label1: 'Egg Sandwich',
          //   label2: "98% Healthy\nFits in Budget",
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // CustomSavedRecipesWidget(
          //   imageUrl: "assets/images/steak.jfif",
          //   label1: 'Steak',
          //   label2: "88% Healthy\nFits in Budget",
          // ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
