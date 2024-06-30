import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/pref.dart';
part 'choise_questions_state.dart';

class ChoiseQuestionsCubit extends Cubit<ChoiseQuestionsState> {
  ChoiseQuestionsCubit() : super(ChoiseQuestionsStateInitial());

  List<int> answers = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1];

  void isSelected(int questionIndex, int indexAnswer) {
    answers[questionIndex] = indexAnswer;
    emit(CheckChoiseAnswer());
  }

  void questionSaveData(int questionIndex, String answer) {
    // if the question is equal 1 means that the user in the fitness level question
    if (questionIndex == 1) {
      Prefs.setString('fitLevel', answer);
    }
    // if the question is equal 2 means that the user in the back question
    if (questionIndex == 2) {
      Prefs.setString('back', answer);
    }
    // if the question is equal 3 means that the user in the knee question
    else if (questionIndex == 3) {
      Prefs.setString('knee', answer);
    }
    // if the survey is the last question then save true in takeSurvey
    else if (questionIndex == 9 && answer.isNotEmpty) {
      Prefs.setString('vegetarian', answer);
      Prefs.setBool('takeSurvey', true);
    }

    emit(SaveChoiseAnswers());
  }
}
