import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';
import 'question_survey.dart';

class ListQuestionItem extends StatefulWidget {
  final int index;
  final int indexAnswer;
  final QuestionModel question;
  final void Function()? onTap;

  const ListQuestionItem({
    super.key,
    required this.index,
    required this.indexAnswer,
    required this.question,
    required this.onTap,
  });

  @override
  State<ListQuestionItem> createState() => _ListQuestionItemState();
}

class _ListQuestionItemState extends State<ListQuestionItem> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween<double>(begin: 2000, end: 0).animate(controller)..addListener(() {
      setState(() {});
    });
    
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(animation.value, 0, 0),
      duration: Duration(milliseconds: 800 + (200 * widget.index)),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          width: 2,
          // index = 1 for the answer checking if it selected or NOT
          color: widget.indexAnswer == widget.index ? purple2 : white,
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
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(19),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 19,
            right: 19,
            top: 33,
            bottom: 33,
          ),
          child: Text(
            widget.question.choice[widget.index],
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
