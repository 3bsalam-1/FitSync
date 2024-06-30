import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/survey_logic/choise_questions_cubit.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import 'create_plan_screen.dart';
import 'exercise_survey_restrict_screen.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/survey_comp/choices_comp/choices_body_question.dart';
import '../../../shared/widgets/survey_comp/choices_comp/question_survey.dart';
import '../writing_questions.dart/writing_health_questions.dart';

class ChoiceExperienceQuestion extends StatelessWidget {
  const ChoiceExperienceQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[0],
      questionIndex: 0,
      onPress: () {
        AnimatedNavigator().push(
          context,
          const ChoiceLevelFitnessQuestion(),
        );
      },
    );
  }
}

class ChoiceLevelFitnessQuestion extends StatelessWidget {
  const ChoiceLevelFitnessQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[1],
      questionIndex: 1,
      onPress: () {
        AnimatedNavigator().push(
          context,
          const ChoiceBackPainQuestion(),
        );
      },
    );
  }
}

class ChoiceBackPainQuestion extends StatelessWidget {
  const ChoiceBackPainQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[2],
      questionIndex: 2,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[2];
        if (selectedAnswer == 0) {
          AnimatedNavigator().push(
            context,
            const ChoiceKneePainQuestion(),
          );
        } else {
          AnimatedNavigator().push(
            context,
            const ExerciseSurveyRestrictScreen(
              labelProblem: 'back',
              screen: ChoiceKneePainQuestion(),
            ),
          );
        }
      },
    );
  }
}

class ChoiceKneePainQuestion extends StatelessWidget {
  const ChoiceKneePainQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[4],
      questionIndex: 4,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[4];
        if (selectedAnswer == 0) {
          AnimatedNavigator().push(
            context,
            const ChoiceDiabetesQuestion(),
          );
        } else {
          AnimatedNavigator().push(
            context,
            const ExerciseSurveyRestrictScreen(
              labelProblem: 'knee',
              screen: ChoiceDiabetesQuestion(),
            ),
          );
        }
      },
    );
  }
}

class ChoiceDiabetesQuestion extends StatelessWidget {
  const ChoiceDiabetesQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[6],
      questionIndex: 6,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[6];
        if (selectedAnswer == 0) {
          AnimatedNavigator().push(
            context,
            const ChoiceHeartDiseaseQuestion(),
          );
        } else {
          AnimatedNavigator().push(
            context,
            const BloodSugarQuestion(),
          );
        }
      },
    );
  }
}

class ChoiceHeartDiseaseQuestion extends StatelessWidget {
  const ChoiceHeartDiseaseQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[7],
      questionIndex: 7,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[7];
        if (selectedAnswer == 0) {
          AnimatedNavigator().push(
            context,
            const ChoiceHypertensionQuestion(),
          );
        } else {
          AnimatedNavigator().push(
            context,
            const SystolicBloodQuestion(),
          );
        }
      },
    );
  }
}

class ChoiceHypertensionQuestion extends StatelessWidget {
  const ChoiceHypertensionQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[8],
      questionIndex: 8,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[7];
        if (selectedAnswer == 0) {
          AnimatedNavigator().push(
            context,
            const ChoiceSleepQuestion(),
          );
        } else {
          AnimatedNavigator().push(
            context,
            const CholesterolLevelQuestion(),
          );
        }
      },
    );
  }
}

class ChoiceSleepQuestion extends StatelessWidget {
  const ChoiceSleepQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[9],
      questionIndex: 9,
      onPress: () {
        AnimatedNavigator().push(
          context,
          const ChoiceDailyWaterQuestion(),
        );
      },
    );
  }
}

class ChoiceDailyWaterQuestion extends StatelessWidget {
  const ChoiceDailyWaterQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[10],
      questionIndex: 10,
      onPress: () {
        AnimatedNavigator().push(
          context,
          const CreatePlanScreen(),
        );
      },
    );
  }
}
