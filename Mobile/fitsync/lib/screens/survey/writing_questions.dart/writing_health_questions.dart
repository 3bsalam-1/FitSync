import '../exercise_survey_screen.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/writing_body_question.dart';
import '../choice_questions.dart/choice_questions_screen.dart';

class BloodSugarQuestion extends StatelessWidget {
  const BloodSugarQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return WritingBodyQuestion(
      onPressed: () {
        AnimatedNavigator().push(
          context,
          const ExerciseSurveyScreen(
            screen: ChoiceHeartDiseaseQuestion(),
          ),
        );
      },
      labelQuestion: 'Please Enter Blood Sugar Level?',
      labelField: '0',
      labelMeagure: 'Mg/dL',
    );
  }
}

class SystolicBloodQuestion extends StatelessWidget {
  const SystolicBloodQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return WritingBodyQuestion(
      onPressed: () {
        AnimatedNavigator().push(
          context,
          const DiastolicBloodQuestion(),
        );
      },
      labelQuestion: 'Enter systolic blood pressure?',
      labelField: '0',
      labelMeagure: 'SYS',
    );
  }
}

class DiastolicBloodQuestion extends StatelessWidget {
  const DiastolicBloodQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return WritingBodyQuestion(
      onPressed: () {
        AnimatedNavigator().push(
          context,
          const ExerciseSurveyScreen(
            screen: ChoiceHypertensionQuestion(),
          ),
        );
      },
      labelQuestion: ' Enter diastolic blood pressure?',
      labelField: '0',
      labelMeagure: 'DIA',
    );
  }
}

class CholesterolLevelQuestion extends StatelessWidget {
  const CholesterolLevelQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return WritingBodyQuestion(
      onPressed: () {
        AnimatedNavigator().push(
          context,
          const ExerciseSurveyScreen(
            screen: ChoiceSleepQuestion(),
          ),
        );
      },
      labelQuestion: 'Please Enter cholesterol level?',
      labelField: '0',
      labelMeagure: 'Mg/dL',
    );
  }
}