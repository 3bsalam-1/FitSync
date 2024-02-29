import 'package:google_fonts/google_fonts.dart';

import '../../../cubits_logic/survey_logic/choise_questions_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/survey_logic/animated_list_view.dart';
import '../../colors/colors.dart';
import 'package:flutter/material.dart';
import '../../../services/pref.dart';
import '../global/animated_navigator.dart';
import 'custom_icon_app_bar.dart';
import 'list_question_item.dart';
import 'question_survey.dart';

class ChoiceBodyQuestion extends StatelessWidget {
  final QuestionModel question;
  final int questionIndex;
  final Widget nextScreen;
  final Widget? nextScreen2;

  const ChoiceBodyQuestion({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.nextScreen,
    this.nextScreen2,
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
                  BlocBuilder<ChoiseQuestionsCubit, int>(
                    builder: (context, state) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: question.choice.length,
                        itemBuilder: (_, index) => ListQuestionItem(
                          index: index,
                          isStarted: isStarted,
                          question: question,
                          indexAnswer: state,
                          onTap: () {
                            // todo save the answers of the questions here
                            context.read<ChoiseQuestionsCubit>().isSelected(index);
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
                                context.read<ChoiseQuestionsCubit>().isSelected(-1);
                                // if the checkQuestion true then go to another writing question
                                bool checkQuestion = questionIndex == 2 ||
                                questionIndex == 4 ||
                                questionIndex == 6 ||
                                questionIndex == 7 ||
                                questionIndex == 8;
                                // if the question is equal 3 means that the user has back pain
                                if (questionIndex == 3) {
                                  Prefs.setString('back', question.choice[index]);
                                }  
                                // if the question is equal 5 means that the user has knee pain
                                if (questionIndex == 5) {
                                  Prefs.setString('knee', question.choice[index]);
                                }    
                                if (index == 1 && checkQuestion) {
                                  AnimatedNavigator().push(
                                    context,
                                    nextScreen2!,
                                  );
                                } else {
                                  // if the checkQuestion false then go to the next question
                                  AnimatedNavigator().push(
                                    context,
                                    nextScreen,
                                  );
                                }
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
