import 'choice_questions_screen.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits_logic/cubit/choise_questions_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';

class ExerciseSurveyScreen extends StatelessWidget {
  const ExerciseSurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoiseQuestionsCubit, List<int>>(
      builder: (context, state) {
      return Scaffold(
        appBar: customIconAppBar(
          onPressed: () {
            context
                .read<ChoiseQuestionsCubit>()
                .navigateToPreviuoseQuestion();
            AnimatedNavigator().pushAndRemoveUntil(
              context,
              const ChoiceQuestionScreen(),
            );
          },
        ),
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                width: double.maxFinite,
                child: Text(
                  'We will restrict exercises that are hard on your knees',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: gray2.withOpacity(0.3),
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/exercises.png',
                  height: 270,
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(height: 60),
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
                  AnimatedNavigator().pushAndRemoveUntil(
                    context,
                    const ChoiceQuestionScreen(),
                  );
                },
                horizontalPadding: 5,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    });
  }
}
