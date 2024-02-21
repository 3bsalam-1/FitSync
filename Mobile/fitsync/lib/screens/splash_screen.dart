import 'package:google_fonts/google_fonts.dart';

import 'survey/welcome_survey_screen.dart';
import '../shared/widgets/global/animated_navigator.dart';
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
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 2),
            builder: (context, value, _) {
              return SizedBox(
                width: double.maxFinite,
                height: height * 0.54,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 400),
                      opacity: value <= 0.5 ? value : 1,
                      child: Image.asset(
                        'assets/images/background_logo.png',
                        width: double.maxFinite,
                        height: height * 0.5,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: value <= 0.7 ? 0 : value,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.contain,
                          width: 200,
                          height: height * 0.43,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: -300, end: 2),
            duration: const Duration(milliseconds: 900),
            builder: (context, value, _) => Transform.translate(
              offset: Offset(value, 0),
              child: Image.asset(
                'assets/images/logo_name.png',
              ),
            ),
          ),
          TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: -300, end: 1),
              duration: const Duration(milliseconds: 900),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Fuel Your Fitness Journey with',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: gray,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                );
              }),
          const Spacer(),
          TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: -300, end: 1),
              duration: const Duration(milliseconds: 900),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: CustomIconButton(
                    label: 'start now',
                    onPressed: () {
                      AnimatedNavigator().pushAndRemoveUntil(
                        context,
                        const WelcomeSurveyScreen(),
                      );
                    },
                  ),
                );
              }),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
