import 'package:fitsync/cubits_logic/survey_logic/text_form_validation_cubit.dart';
import 'package:fitsync/data/cubit/user_data/user_data_info_cubit.dart';
import 'package:fitsync/data/models/user_personal_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/survey_logic/choise_questions_cubit.dart';
import '../../../services/pref.dart';
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
      question: questionSurvey[3],
      questionIndex: 3,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[3];
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
      question: questionSurvey[4],
      questionIndex: 4,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[4];
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
      question: questionSurvey[5],
      questionIndex: 5,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[5];
        if (selectedAnswer == 0) {
          AnimatedNavigator().push(
            context,
            const BloodPressureQuestion(),
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
      question: questionSurvey[6],
      questionIndex: 6,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[6];
        if (selectedAnswer == 0) {
          AnimatedNavigator().push(
            context,
            const BmrQuestion(),
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
      question: questionSurvey[7],
      questionIndex: 7,
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
      question: questionSurvey[8],
      questionIndex: 8,
      onPress: () {
        AnimatedNavigator().push(
          context,
          const VegetarianChoiceQuestion(),
        );
      },
    );
  }
}

class VegetarianChoiceQuestion extends StatelessWidget {
  const VegetarianChoiceQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataInfoCubit, UserDataInfoState>(
      listener: (context, state) {
        if (state is UserDataFailure) {
          state.showFaliure(context);
        } else if (state is UserDataLoading) {
          state.showLoadingDialog(context);
        } else if (state is UserDataSuccess) {
          context.read<UserDataInfoCubit>().removeData();
          AnimatedNavigator().push(
            context,
            const CreatePlanScreen(),
          );
        }
      },
      child: ChoiceBodyQuestion(
        question: questionSurvey[9],
        questionIndex: 9,
        onPress: () {
          bool backPain = context.read<ChoiseQuestionsCubit>().answers[2] == 0? false: true;
          bool kneePain = context.read<ChoiseQuestionsCubit>().answers[3] == 0? false: true;
          bool diabetes = context.read<ChoiseQuestionsCubit>().answers[4] == 0? false: true;
          bool heartCondition = context.read<ChoiseQuestionsCubit>().answers[5] == 0? false: true;
          bool hypertension = context.read<ChoiseQuestionsCubit>().answers[6] == 0? false: true;
          bool vegetarian = context.read<ChoiseQuestionsCubit>().answers[9] == 0? false: true;
          int activeLevel = context.read<ChoiseQuestionsCubit>().answers[1];
          
          context.read<UserDataInfoCubit>().saveUserData(
            context: context,
            info: UserPersonalInfoModel(
              weight: Prefs.getDouble('weight')!, 
              height: Prefs.getDouble('height')!,
              birthdate: context.read<TextFormValidationCubit>().birthDateController, 
              gender: Prefs.getInt('gender')!, 
              activityLevel: activeLevel, 
              systolicBP: Prefs.getDouble('sys')?? 10, 
              diastolicBP: Prefs.getDouble('dias') ?? 10, 
              cholesterolLevel: Prefs.getDouble('chol') ?? 10, 
              bloodSugar: Prefs.getDouble('bloodSugare') ?? 10, 
              hypertension: hypertension, 
              diabetes: diabetes, 
              heartCondition: heartCondition, 
              lowPressure: Prefs.getDouble('bP')!, 
              bmr: Prefs.getDouble('bmr')!, 
              kneePain: kneePain, 
              backPain: backPain, 
              vegetarian: vegetarian,
            ), 
            token: Prefs.getString('token')!,
          );
        },
      ),
    );
  }
}