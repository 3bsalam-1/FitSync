import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/home_comp/parameters_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalorieScreen extends StatelessWidget {
  const CalorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AnimatedNavigator().pop(context);
              },
              icon: Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              )),
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Calorie Parameters",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: black,
            
                // fontFamily:
              ),
            ),
          ),
          backgroundColor: white,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 18, bottom: 12),
                  child: Row(
                    children: [
                      Text(
                        'Quantity per day',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                ),
                ParametersTextFormField(label: "Kcal"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * (150 / 926),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: CustomButton(label: "Save", onPressed: () {}),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
