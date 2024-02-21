import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../../shared/widgets/workouts_comp/workouts_challenges/animated_circle_progress.dart';

class ChallengeBeginScreen extends StatelessWidget {
  const ChallengeBeginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/start_challenge.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          Text(
            'Reclining to big toe',
            style: GoogleFonts.poppins(
              fontSize: 26,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(flex: 1),
          const AnimatedCircleProgress(seconds: 10),
          const Spacer(flex: 2),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: 'Previous',
                shadowColor: Colors.transparent,
                colors: const [gray14, gray14],
                onPressed: () {
                  // todo start the challenge
                },
                horizontalPadding: 15,
                width: width * 0.38,
              ),
              CustomButton(
                label: 'Skip',
                onPressed: () {
                  // todo start the challenge
                },
                horizontalPadding: 15,
                width: width * 0.38,
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
