part of 'choise_questions_cubit.dart';

@immutable
sealed class ChoiseQuestionsState {}

final class ChoiseQuestionsStateInitial extends ChoiseQuestionsState {}

final class CheckChoiseAnswer extends ChoiseQuestionsState {}

final class SaveChoiseAnswers extends ChoiseQuestionsState {}