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
    question: 'What’s Your Goal?', 
    choice: [
      'Get toned',
      'Lose Weight',
      'Get fitter',
      'Modify my diet',
      'Modify Muscle',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'What’s Your body type?', 
    choice: [
      'Hourglass',
      'Rectangle',
      'Rounded',
      'Lightbulb',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'What’s Your Focus Area?', 
    choice: [
      'Arms',
      'Belly',
      'Butt',
      'Thighs',
      'Back',
    ], 
    answer: -1,
  ),
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
      'Beginner',
      'Intermediate',
      'Advanced',
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
    question: 'How Serious are Your Problem?', 
    choice: [
      'Mid pain',
      'َQuite pain',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'What does your typical day look like?', 
    choice: [
      'mostly walking',
      'mostly on foot',
      'mostly seated',
      'At home, inactive',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'How many push-up canyou do?', 
    choice: [
      '30+',
      '15 - 29',
      '6 - 14',
      'less than 5',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'How much do you walk daily?', 
    choice: [
      'less than 1 hour',
      '1 - 2 hours',
      'more than 2 hours',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'Any Bad Habits ?', 
    choice: [
      'i have a sweet tooth',
      'i love sugary drinks',
      'i dont sleep enough',
      'i enjoy fast food',
      'i eat late at night',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'How are your energy levels during the day?', 
    choice: [
      'stable throughout the day',
      'i feel tired around lunch time',
      'i need a nap after meals',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'When was the last time you were at your ideal weight?', 
    choice: [
      'less than a year ago',
      '1 - 2 years ago',
      'more than 2 years',
      'Never',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'When was the last time you were at your ideal weight?', 
    choice: [
      'less than a year ago',
      '1 - 2 years ago',
      'more than 2 years',
      'Never',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'How much do you sleep every night ?', 
    choice: [
      'more than 8 hours',
      '7 - 8 hours',
      '6 - 7 hours',
      'less than 8 hours',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'What diet do you follow ?', 
    choice: [
      'Low Fat diet',
      'Low Carb diet',
      'vegan diet',
      'vegetarian diet',
      'Keto diet',
      'Mediterranean diet',
      'alkaline diet',
      'None',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'What inspires you to keep fit?', 
    choice: [
      'Stress relief',
      'Hobby pursuit',
      'Increased vitality',
      'Athletic passion',
      'Mental clarity',
      'Body confidence',
      'Improve health',
      'Personal goals',
    ], 
    answer: -1,
  ),
  QuestionModel(
    question: 'What is your daily water intake ?', 
    choice: [
      'more than 6 glasses',
      '3 to 6 glasses',
      '1 to 2 glasses',
      'I only drink soda or coffee',
    ], 
    answer: -1,
  ),
];
