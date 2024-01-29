import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../question_survey.dart';

class ListQuestionItem extends StatelessWidget {
  final bool isStarted;
  final int index;
  final List<int> indexQuestion;
  final List<QuestionModel> questionSurvey;

  const ListQuestionItem({
    super.key,
    required this.index,
    required this.indexQuestion,
    required this.isStarted,
    required this.questionSurvey,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(isStarted ? 0 : 2000, 0, 0),
      duration: Duration(milliseconds: 800 + (200 * index)),
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 19,
        top: 33,
        bottom: 33,
      ),
      decoration: BoxDecoration(
        // index = 1 for the answer checking if it selected or NOT
        color: indexQuestion[1] == index ? purple2 : white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
            color: black2.withOpacity(0.2),
          ),
        ],
      ),
      child: Text(
        questionSurvey[indexQuestion[0]].choice[index],
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          // index = 1 for the answer checking if it selected or NOT
          color: indexQuestion[1] == index ? white : black,
        ),
      ),
    );
  }
}
