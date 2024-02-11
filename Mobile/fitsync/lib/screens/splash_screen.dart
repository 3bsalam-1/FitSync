import 'package:fitsync/screens/survey/welcome_survey_screen.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';

import '../shared/colors/colors.dart';
import '../shared/widgets/global/custom_icon_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: height*0.1),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background_logo.png'),
              ),
            ),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              width: 200,
              height: height * 0.43,
            ),
          ),
          const SizedBox(height: 30),
          Image.asset(
            'assets/images/logo_name.png',
          ),
          const SizedBox(
            width: double.maxFinite,
            child: Text(
              'Fuel Your Fitness Journey with',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                color: gray,
              ),
            ),
          ),
          const Spacer(),
          CustomIconButton(
            label: 'start now',
            onPressed: () {
              AnimatedNavigator().pushAndRemoveUntil(
                context,
                const WelcomeSurveyScreen(),
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
