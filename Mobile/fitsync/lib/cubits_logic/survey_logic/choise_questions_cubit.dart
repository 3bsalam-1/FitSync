import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/pref.dart';
part 'choise_questions_state.dart';

class ChoiseQuestionsCubit extends Cubit<ChoiseQuestionsState> {
  ChoiseQuestionsCubit() : super(ChoiseQuestionsStateInitial());

  List<int> answers = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];

  void isSelected(int questionIndex, int indexAnswer) {
    answers[questionIndex] = indexAnswer;
    emit(CheckChoiseAnswer());
  }

  void questionSaveData(int questionIndex, String answer) {
    // if the question is equal 2 and select no as answer that means user has not back pain
    if (questionIndex == 2 && answer == 'NO') {
      Prefs.setString('back', 'false');
    }
    // if the question is equal 3 means that the user has back pain
    else if (questionIndex == 3) {
      Prefs.setString('back', answer);
    }
    // if the question is equal 4 and select no as answer that means user has not knee pain
    else if (questionIndex == 4 && answer == 'NO') {
      Prefs.setString('knee', 'false');
    }
    // if the question is equal 5 means that the user has knee pain
    else if (questionIndex == 5) {
      Prefs.setString('knee', answer);
    }
    // if the survey is the last question then save true in takeSurvey
    else if (questionIndex == 10 && answer.isNotEmpty) {
      Prefs.setBool('takeSurvey', true);
    }

    emit(SaveChoiseAnswers());
  }
}
