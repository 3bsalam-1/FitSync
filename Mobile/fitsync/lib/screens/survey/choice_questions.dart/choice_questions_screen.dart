import 'exercise_survey_restrict_screen.dart';
import '../welcome_survey_screen.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/survey_comp/choices_body_question.dart';
import '../../../shared/widgets/survey_comp/question_survey.dart';
import '../writing_questions.dart/writing_health_questions.dart';

class ChoiceExperienceQuestion extends StatelessWidget {
  const ChoiceExperienceQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[0],
      questionIndex: 0,
      nextScreen: const ChoiceLevelFitnessQuestion(),
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
      nextScreen: const ChoiceBackPainQuestion(),
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
      nextScreen2: const ChoiceBackSeriousQuestion(),
      nextScreen: const ChoiceKneePainQuestion(),
    );
  }
}

class ChoiceBackSeriousQuestion extends StatelessWidget {
  const ChoiceBackSeriousQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[3],
      questionIndex: 3,
      nextScreen: const ExerciseSurveyRestrictScreen(
        labelProblem: 'back',
        screen: ChoiceKneePainQuestion(),
      ),
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
      nextScreen2: const ChoiceKneeSeriousQuestion(),
      nextScreen: const ChoiceDiabetesQuestion(),
    );
  }
}

class ChoiceKneeSeriousQuestion extends StatelessWidget {
  const ChoiceKneeSeriousQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[5],
      questionIndex: 5,
      nextScreen: const ExerciseSurveyRestrictScreen(
        labelProblem: 'knee',
        screen: ChoiceDiabetesQuestion(),
      ),
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
      nextScreen2: const BloodSugarQuestion(),
      nextScreen: const ChoiceHeartDiseaseQuestion(),
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
      nextScreen2: const SystolicBloodQuestion(),
      nextScreen: const ChoiceHypertensionQuestion(),
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
      nextScreen2: const CholesterolLevelQuestion(),
      nextScreen: const ChoiceSleepQuestion(),
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
      nextScreen: const ChoiceDailyWaterQuestion(),
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
      nextScreen: const WelcomeSurveyScreen(),
    );
  }
}
