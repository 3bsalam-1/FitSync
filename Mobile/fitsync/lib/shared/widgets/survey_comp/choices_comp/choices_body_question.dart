import 'package:google_fonts/google_fonts.dart';
import '../../../../cubits_logic/survey_logic/choise_questions_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits_logic/survey_logic/animated_list_view.dart';
import '../../../colors/colors.dart';
import 'package:flutter/material.dart';
import '../../global/animated_navigator.dart';
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
    return BlocBuilder<AnimatedListView, bool>(
      builder: (context, isStarted) {
        return Scaffold(
          appBar: customIconAppBar(
            onPressed: () {
              Future.delayed(
                const Duration(milliseconds: 500),
                () {
                  context.read<AnimatedListView>().stopAnimation();
                },
              );
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  context.read<AnimatedListView>().startAnimation();
                  AnimatedNavigator().pop(context);
                },
              );
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
                  AnimatedOpacity(
                    // if the animation started show the text
                    opacity: isStarted ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
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
                          isStarted: isStarted,
                          question: question,
                          indexAnswer: context.read<ChoiseQuestionsCubit>().answers[questionIndex],
                          onTap: () {
                            context.read<ChoiseQuestionsCubit>().isSelected(questionIndex, index);
                            Future.delayed(
                              const Duration(milliseconds: 900),
                              () {
                                context.read<AnimatedListView>().stopAnimation();
                              },
                            );
                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                context.read<AnimatedListView>().startAnimation();
                                onPress();
                              },
                            );
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
      },
    );
  }
}
