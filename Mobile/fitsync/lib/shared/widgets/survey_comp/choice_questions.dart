import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/cubit/animated_list_view.dart';
import '../../../cubits_logic/cubit/choise_questions_cubit.dart';
import '../../question_survey.dart';
import 'package:flutter/material.dart';
import '../../colors/colors.dart';
import 'list_question_item.dart';

class ChoiceQuestion extends StatefulWidget {
  const ChoiceQuestion({super.key});

  @override
  State<ChoiceQuestion> createState() => _ChoiceQuestionState();
}

class _ChoiceQuestionState extends State<ChoiceQuestion> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<AnimatedListView, bool>(
        builder: (_, isStarted) => BlocBuilder<ChoiseQuestionsCubit, List<int>>(
          builder: (context, indexQuestion) => Column(
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
                itemCount: questionSurvey[indexQuestion[0]].choice.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    //                                            question number  , answer
                    context.read<ChoiseQuestionsCubit>().isSelected(indexQuestion[0], index);
                    Future.delayed(const Duration(milliseconds: 500), () {
                      context.read<AnimatedListView>().stopAnimation();
                    });
                    Future.delayed(const Duration(seconds: 2), () {
                      context.read<ChoiseQuestionsCubit>().nextQuestion(index);
                      context.read<AnimatedListView>().startAnimation();
                    });
                  },
                  borderRadius: BorderRadius.circular(19),
                  child: ListQuestionItem(
                    index: index, 
                    indexQuestion: indexQuestion, 
                    isStarted: isStarted, 
                    questionSurvey: questionSurvey,
                  ), 
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
