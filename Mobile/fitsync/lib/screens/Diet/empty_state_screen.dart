import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';

import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyStateScreen extends StatelessWidget {
  EmptyStateScreen({super.key});

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
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/images/empty state image.png',
                width: MediaQuery.of(context).size.width * (322 / 428),
                height: MediaQuery.of(context).size.height * (430 / 926),
              ),
              Text(
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
