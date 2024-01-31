import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits_logic/cubit/animated_list_view.dart';
import '../../cubits_logic/cubit/choise_questions_cubit.dart';
import '../../shared/question_survey.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../shared/widgets/survey_comp/list_question_item.dart';

class ChoiceQuestionScreen extends StatelessWidget {
  const ChoiceQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChoiseQuestionsCubit(),
        ),
        BlocProvider(
          create: (context) => AnimatedListView()..startAnimation(),
        ),
      ],
      child: BlocBuilder<AnimatedListView, bool>(
        builder: (context, isStarted) {
          return BlocBuilder<ChoiseQuestionsCubit, List<int>>(
            builder: (context, indexQuestion) {
              return Scaffold(
                appBar: customIconAppBar(onPressed: () {
                  // if the number of the questions > 0 then back to prevoius question
                  if (indexQuestion[0] > 0) {
                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        context.read<AnimatedListView>().stopAnimation();
                      },
                    );
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        context.read<ChoiseQuestionsCubit>().backQuestion(
                          indexQuestion[0],
                        );
                        context.read<AnimatedListView>().startAnimation();
                      },
                    );
                    
                  } else {
                    AnimatedNavigator().pop(context);
                  }
                }),
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
                            questionSurvey[indexQuestion[0]].question,
                            style: const TextStyle(
                              fontSize: 26,
                              color: black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              questionSurvey[indexQuestion[0]].choice.length,
                          itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              context.read<ChoiseQuestionsCubit>().isSelected(
                                indexQuestion[0],
                                index,
                              );
                              Future.delayed(
                                const Duration(milliseconds: 500),
                                () {
                                  context.read<AnimatedListView>().stopAnimation();
                                },
                              );
                              Future.delayed(
                                const Duration(seconds: 2),
                                () {
                                  context.read<ChoiseQuestionsCubit>().nextQuestion(
                                    indexQuestion[0],
                                  );
                                  context.read<AnimatedListView>().startAnimation();
                                },
                              );
                            },
                            borderRadius: BorderRadius.circular(19),
                            child: ListQuestionItem(
                              index: index,
                              indexQuestion: indexQuestion,
                              isStarted: isStarted,
                              questionSurvey: questionSurvey,
                            ),
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
