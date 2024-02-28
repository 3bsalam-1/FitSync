import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';

class ExerciseSurveyScreen extends StatelessWidget {
  final Widget screen;
  const ExerciseSurveyScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Text(
                'We will recommend exercises and suitable healthy diet',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 14,
              ),
              decoration: const BoxDecoration(
                color: white,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/exercise_male.png',
                  ),
                ),
              ),
              child: Image.asset(
                'assets/images/man.png',
                height: 270,
                width: double.maxFinite,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'You can always change this setting later',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: black,
              ),
            ),
            Text(
              'please consult your physician or other',
               style: GoogleFonts.poppins(
                fontSize: 18,
                color: black,
              ),
            ),
            Text(
              'health care professional when in doubt',
               style: GoogleFonts.poppins(
                fontSize: 18,
                color: black,
              ),
            ),
            const Spacer(),
            CustomButton(
              label: 'continue',
              onPressed: () {
                AnimatedNavigator().push(
                  context,
                  screen,
                );
              },
              horizontalPadding: 5,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
