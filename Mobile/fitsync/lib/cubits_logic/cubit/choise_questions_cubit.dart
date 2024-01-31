import '../../shared/pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiseQuestionsCubit extends Cubit<List<int>> {
  ChoiseQuestionsCubit() : super([0, -1]);
  List<String> answers = [];

  void nextQuestion(int index) => emit([index + 1, -1]);

  void backQuestion(int questionIndex) {
    List<String> answer = Prefs.getStringList('answers');
    emit([
      questionIndex - 1,
      int.parse(answer[questionIndex - 1]),
    ]);
  }

  void isSelected(int index, int answerIndex) {
    if (answers.length > index) {
      answers[index] = answerIndex.toString();
    } else {
      answers.add(answerIndex.toString());
    }
    Prefs.setStringList('answers', answers);
    emit([index, answerIndex]);
  }

  void navigateToNewQuestion() {
    emit([7, -1]);
  }

  void navigateToPreviuoseQuestion() {
    List<String> answer = Prefs.getStringList('answers');
    emit([
      6,
      int.parse(answer[6]),
    ]);
  }
}
