import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/survey_logic/choice_gender.dart';
import '../Login/login_screen.dart';
import 'writing_questions.dart/name_question_screen.dart';
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
                    const SizedBox(height: 55),
                    Expanded(
                      child: CustomCard(
                        imagePath: 'assets/images/female.png',
                        label: 'Female',
                        labelColor: black,
                        background: white,
                        borderColor: isSelected == 1 ? purple2 : white,
                        onTap: () {
                          context.read<ChoiceGender>().isFemale();
                          Future.delayed(const Duration(milliseconds: 700), () {
                            AnimatedNavigator().push(
                              context,
                              const NameQuestionScreen(),
                            );
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    Expanded(
                      child: CustomCard(
                        imagePath: 'assets/images/male.png',
                        label: 'Male',
                        labelColor: black,
                        background: white,
                        borderColor: isSelected == 0 ? purple2 : white,
                        onTap: () {
                          context.read<ChoiceGender>().isMale();
                          Future.delayed(const Duration(milliseconds: 700), () {
                            AnimatedNavigator().push(
                              context,
                              const NameQuestionScreen(),
                            );
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 60),
                    Center(
                      child: Text(
                        'Already have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: gray2,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      label: 'log in',
                      onPressed: () {
                        AnimatedNavigator().push(
                          context,
                          const loginPage(),
                        );
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
