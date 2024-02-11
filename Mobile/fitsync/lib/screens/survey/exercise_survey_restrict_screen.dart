import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/survey_comp/custom_icon_app_bar.dart';

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
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Text(
                'We will restrict exercises that are hard on your $labelProblem',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: black,
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
            const SizedBox(height: 20),
            const Text(
              'You can always change this setting later',
              style: TextStyle(
                fontSize: 18,
                color: black,
              ),
            ),
            const Text(
              'please consult your physician or other',
              style: TextStyle(
                fontSize: 18,
                color: black,
              ),
            ),
            const Text(
              'health care professional when in doubt',
              style: TextStyle(
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
