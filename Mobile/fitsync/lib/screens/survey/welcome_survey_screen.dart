import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits_logic/cubit/choice_gender.dart';
import '../../screens/survey/survey_screen.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/survey_comp/custom_card.dart';
import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';

class WelcomeSurveyScreen extends StatelessWidget {
  const WelcomeSurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ChoiceGender(),
        child: Scaffold(
          body: Container(
            color: white,
            margin: const EdgeInsets.symmetric(horizontal: 17),
            child: BlocBuilder<ChoiceGender, int>(
              builder: (context, isSelected) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 26),
                    const Text(
                      'Welcome to FitSync',
                      style: TextStyle(
                          color: gray2,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    ),
                    const Text(
                      'What’s Your Gender ?',
                      style: TextStyle(
                          color: black,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 55),
                    Expanded(
                      child: CustomCard(
                        imagePath: 'assets/images/female.png',
                        label: 'Female',
                        labelColor: isSelected == 1 ? white : black,
                        background: isSelected == 1 ? purple2 : white,
                        onTap: () {
                          context.read<ChoiceGender>().isFemale();
                          Future.delayed(
                            const Duration(milliseconds: 700),
                            () {
                              AnimatedNavigator().push(
                                context,
                                const SurveyScreen(),
                              );
                            }
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    Expanded(
                      child: CustomCard(
                        imagePath: 'assets/images/male.png',
                        label: 'Male',
                        labelColor: isSelected == 0 ? white : black,
                        background: isSelected == 0 ? purple2 : white,
                        onTap: () {
                          context.read<ChoiceGender>().isMale();
                          Future.delayed(
                            const Duration(milliseconds: 700),
                            () {
                              AnimatedNavigator().push(
                                context,
                                const SurveyScreen(),
                              );
                            }
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 60),
                    TextButton(
                      onPressed: () {
                        //TODO Go to register page
                      },
                      child: const Center(
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(
                              color: gray2,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      label: 'log in',
                      onPressed: () {
                        // TODO Go to login page
                      },
                    ),
                    const SizedBox(height: 60),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
