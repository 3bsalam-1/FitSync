import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiseQuestionsCubit extends Cubit<List<int>> {
  ChoiseQuestionsCubit() : super([0, -1]);

  void nextQuestion(int index) => emit([index + 1, -1]);

  void backQuestion(int index) => emit([index - 1, -1]);

  void isSelected(int index, int answerIndex) => emit([index, answerIndex]);
}
