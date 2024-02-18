import 'package:flutter/material.dart';
import '../../colors/colors.dart';
import 'question_survey.dart';

class ListQuestionItem extends StatelessWidget {
  final bool isStarted;
  final int index;
  final int indexAnswer;
  final QuestionModel question;
  final void Function()? onTap;

  const ListQuestionItem({
    super.key,
    required this.index,
    required this.indexAnswer,
    required this.isStarted,
    required this.question,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(isStarted ? 0 : 2000, 0, 0),
      duration: Duration(milliseconds: 800 + (200 * index)),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          width: 2,
          // index = 1 for the answer checking if it selected or NOT
          color: indexAnswer == index ? purple2 : white,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
            color: black2.withOpacity(0.2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(19),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 19,
            top: 33,
            bottom: 33,
          ),
          child: Text(
            question.choice[index],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: black,
            ),
          ),
        ),
      ),
    );
  }
}
