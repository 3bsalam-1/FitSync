class QuestionModel {
  final String question;
  final List<String> choice;
  final int answer;

  QuestionModel({
    required this.question,
    required this.choice,
    required this.answer,
  });
}

List<QuestionModel> questionSurvey = [
  QuestionModel(
    question: 'Any Previous experience workout?',
    choice: [
      'Yes, i workout regularly',
      'Yes, less than a year',
      'Yes, less than 1 year',
      'No, i dont’ have any previouss experience',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'What is your current level of Fitness?',
    choice: [
      'Low',
      'Intermediate',
      'High',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'Do You Suffer from Back Pain?',
    choice: [
      'NO',
      'YES',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'Do You Suffer from Knee Pain?',
    choice: [
      'NO',
      'YES',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'Do You Suffer from Diabetes?',
    choice: [
      'NO',
      'YES',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'Do You Suffer from Heart Disease?',
    choice: [
      'NO',
      'YES',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'Do You Suffer from Hypertension?',
    choice: [
      'NO',
      'YES',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'How much do you sleep every night?',
    choice: [
      'more than 8 hours',
      '7 - 8 hours',
      '6 - 7 hours',
      'less than 8 hours',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'What is your daily water intake?',
    choice: [
      'more than 6 glasses',
      '3 to 6 glasses',
      '1 to 2 glasses',
      'I only drink soda or coffee',
    ],
    answer: -1,
  ),
  QuestionModel(
    question: 'Are You Vegetarian?',
    choice: [
      'NO',
      'YES',
    ],
    answer: -1,
  ),
];
