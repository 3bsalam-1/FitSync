import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../home_main_screen.dart';

class CreatePlanScreen extends StatelessWidget {
  const CreatePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: purple5,
              ),
            ),
            child: const Icon(
              Icons.check,
              color: purple5,
              size: 35,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your plan is ready!',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: black,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            'assets/images/survey/rafiki.png',
            width: MediaQuery.of(context).size.width - 10,
            height: 320,
            fit: BoxFit.fill,
          ),
          const Spacer(),
          SizedBox(
            width: 270,
            child: Text(
              'We create a plan according to your data, activity level and interests',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: black,
              ),
            ),
          ),
          const Spacer(),
          CustomButton(
            label: 'Continue',
            horizontalPadding: 15,
            onPressed: () {
              AnimatedNavigator().pushAndRemoveUntil(
                context,
                const HomeMainScreen(),
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
