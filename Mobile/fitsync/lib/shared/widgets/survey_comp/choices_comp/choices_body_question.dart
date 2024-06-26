import 'package:google_fonts/google_fonts.dart';
import '../../../../cubits_logic/survey_logic/choise_questions_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../colors/colors.dart';
import 'package:flutter/material.dart';
import '../../global/animated_navigator.dart';
import '../../global/custom_animated_opacity.dart';
import '../custom_icon_app_bar.dart';
import 'list_question_item.dart';
import 'question_survey.dart';

class ChoiceBodyQuestion extends StatelessWidget {
  final QuestionModel question;
  final int questionIndex;
  final void Function() onPress;

  const ChoiceBodyQuestion({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                child: Text(
                  // index = 0 for the question index
                  question.question,
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              BlocBuilder<ChoiseQuestionsCubit, ChoiseQuestionsState>(
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: question.choice.length,
                    itemBuilder: (_, index) => ListQuestionItem(
                      index: index,
                      question: question,
                      indexAnswer: context.read<ChoiseQuestionsCubit>().answers[questionIndex],
                      onTap: () {
                        context.read<ChoiseQuestionsCubit>().isSelected(questionIndex, index);
                        if (context.read<ChoiseQuestionsCubit>().answers[9] != -1) {
                          onPress();
                        } else {
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              onPress();
                            },
                          );
                        }
                      },
                    ),
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
