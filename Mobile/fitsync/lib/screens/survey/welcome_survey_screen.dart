import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/survey_logic/choice_gender.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/survey_comp/choices_comp/custom_card.dart';
import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';

import 'writing_questions.dart/date_birth_screen.dart';

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
                    Text(
                      'Welcome to FitSync',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: gray2,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      'What’s Your Gender ?',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        color: black,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: CustomCard(
                        icon: Icons.male,
                        label: 'Male',
                        bgColor: isSelected == 0
                            ? purple5
                            : purple5.withOpacity(0.3),
                        onTap: () {
                          context.read<ChoiceGender>().isMale();
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: CustomCard(
                        icon: Icons.female,
                        label: 'Female',
                        bgColor: isSelected == 1
                            ? purple5
                            : purple5.withOpacity(0.3),
                        onTap: () {
                          context.read<ChoiceGender>().isFemale();
                        },
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      horizontalPadding: 20,
                      label: 'Continue',
                      onPressed: () {
                        if (isSelected != -1) {
                          AnimatedNavigator().push(
                            context,
                            const DateBirthScreen(),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 30),
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
