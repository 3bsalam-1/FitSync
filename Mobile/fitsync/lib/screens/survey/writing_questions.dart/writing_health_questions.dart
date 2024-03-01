import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../../shared/widgets/survey_comp/custom_snackbar.dart';
import '../choice_questions.dart/exercise_survey_screen.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/writing_body_question.dart';
import '../choice_questions.dart/choice_questions_screen.dart';

class BloodSugarQuestion extends StatelessWidget {
  const BloodSugarQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
      listener: (context, state) {
        if (state is BloodSugarValidation) {
          if (state.errorText == null) {
            FocusScope.of(context).unfocus();
            AnimatedNavigator().push(
              context,
              const ExerciseSurveyScreen(
                screen: ChoiceHeartDiseaseQuestion(),
              ),
            );
          } else {
            customSnackBar(context, state.errorText!);
          }
        }
      },
      builder: (context, state) => WritingBodyQuestion(
        onPressed: () {
          context.read<TextFormValidationCubit>().bloodSugarValidate();
        },
        controller: context.read<TextFormValidationCubit>().bloodSugarController,
        labelQuestion: 'Please Enter Blood Sugar Level?',
        labelField: '0',
        labelMeagure: 'Mg/dL',
      ),
    );
  }
}

class SystolicBloodQuestion extends StatelessWidget {
  const SystolicBloodQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
      listener: (context, state) {
        if (state is SystolicBloodValidation) {
          if (state.errorText == null) {
            FocusScope.of(context).unfocus();
            AnimatedNavigator().push(
              context,
              const DiastolicBloodQuestion(),
            );
          } else {
            customSnackBar(context, state.errorText!);
          }
        }
      },
      builder: (context, state) => WritingBodyQuestion(
        onPressed: () {
          context.read<TextFormValidationCubit>().systolicBloodValidate();
        },
        controller: context.read<TextFormValidationCubit>().systolicController,
        labelQuestion: 'Enter systolic blood pressure?',
        labelField: '0',
        labelMeagure: 'SYS',
      ),
    );
  }
}

class DiastolicBloodQuestion extends StatelessWidget {
  const DiastolicBloodQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
      listener: (context, state) {
        if (state is DiastolicBloodValidation) {
          if (state.errorText == null) {
            FocusScope.of(context).unfocus();
            AnimatedNavigator().push(
              context,
              const ExerciseSurveyScreen(
                screen: ChoiceHypertensionQuestion(),
              ),
            );
          } else {
            customSnackBar(context, state.errorText!);
          }
        }
      },
      builder: (context, state) => WritingBodyQuestion(
        onPressed: () {
          context.read<TextFormValidationCubit>().diastolicBloodValidate();
        },
        controller: context.read<TextFormValidationCubit>().diastolicController,
        labelQuestion: ' Enter diastolic blood pressure?',
        labelField: '0',
        labelMeagure: 'DIA',
      ),
    );
  }
}

class CholesterolLevelQuestion extends StatelessWidget {
  const CholesterolLevelQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
      listener: (context, state) {
        if (state is CholesterolValidation) {
          if (state.errorText == null) {
            FocusScope.of(context).unfocus();
            AnimatedNavigator().push(
              context,
              const ExerciseSurveyScreen(
                screen: ChoiceSleepQuestion(),
              ),
            );
          } else {
            customSnackBar(context, state.errorText!);
          }
        }
      },
      builder: (context, state) => WritingBodyQuestion(
        onPressed: () {
          context.read<TextFormValidationCubit>().cholesterolValidate();
        },
        controller:
            context.read<TextFormValidationCubit>().cholesterolController,
        labelQuestion: 'Please Enter cholesterol level?',
        labelField: '0',
        labelMeagure: 'Mg/dL',
      ),
    );
  }
}
