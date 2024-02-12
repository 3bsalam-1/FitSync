import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/workouts_comp/workouts_challenges/animated_circle_progress.dart';

class StartChallengeScreen extends StatelessWidget {
  const StartChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: Column(
        children: [
          const Spacer(flex: 2),
          const Text(
            'Get Ready!',
            style: TextStyle(
              color: purple5,
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(flex: 1),
          // todo show the numder of seconds
          const AnimatedCircleProgress(seconds: 15),
          const Spacer(flex: 2),
          CustomButton(
            label: 'Start over', 
            onPressed: (){
              // todo start the challenge
            },
            horizontalPadding: 100,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}