import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'choise_questions_state.dart';

class ChoiseQuestionsCubit extends Cubit<ChoiseQuestionsState> {
  ChoiseQuestionsCubit() : super(ChoiseQuestionsStateInitial());

  List<int> answers = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1];

  void isSelected(int questionIndex, int indexAnswer) {
    answers[questionIndex] = indexAnswer;
    emit(CheckChoiseAnswer());
  }
}
