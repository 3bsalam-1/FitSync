import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_saved_recipes.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/survey_comp/choices_comp/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class SavedRecipesScreen extends StatelessWidget {
  SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
            onPressed: () {
              AnimatedNavigator().pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left,
              color: purple3,
              size: 40,
            )),
        title: Text(
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
            padding: const EdgeInsets.only(right: 10.0),
            child: UserWidget(),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomSavedRecipesWidget(
            imageUrl: "assets/images/Green Salad.jfif",
            label1: 'Green Salad',
            label2: "100% Healthy\n Fits in Budget",
          ),
          SizedBox(
            height: 10,
          ),
          CustomSavedRecipesWidget(
            imageUrl: "assets/images/Egg Sandwich.jfif",
            label1: 'Egg Sandwich',
            label2: "98% Healthy\nFits in Budget",
          ),
          SizedBox(
            height: 10,
          ),
          CustomSavedRecipesWidget(
            imageUrl: "assets/images/steak.jfif",
            label1: 'Steak',
            label2: "88% Healthy\nFits in Budget",
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
