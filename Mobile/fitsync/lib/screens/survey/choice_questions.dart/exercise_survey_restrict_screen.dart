import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/custom_animated_opacity.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';

class ExerciseSurveyRestrictScreen extends StatelessWidget {
  final String labelProblem;
  final Widget screen;

  const ExerciseSurveyRestrictScreen({
    super.key,
    required this.labelProblem,
    required this.screen,
  });

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
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAnimatedOpacity(
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  'We will restrict exercises that are hard on your $labelProblem',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            CustomAnimatedOpacity(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 14,
                ),
                decoration: const BoxDecoration(
                  color: white,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      'assets/images/exercise_female.png',
                    ),
                  ),
                ),
                child: Image.asset(
                  'assets/images/lady.png',
                  height: 270,
                  width: double.maxFinite,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomAnimatedOpacity(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Text(
                  'You can always change this setting later health care professional when in doubt please consult your physician or other',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: black,
                  ),
                ),
              ),
            ),
            const Spacer(),
            CustomAnimatedOpacity(
              child: CustomButton(
                label: 'continue',
                onPressed: () {
                  AnimatedNavigator().push(
                    context,
                    screen,
                  );
                },
                horizontalPadding: 5,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
