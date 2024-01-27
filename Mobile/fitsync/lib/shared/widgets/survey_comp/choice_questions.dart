import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/cubit/animated_list_view.dart';
import '../../../cubits_logic/cubit/choise_questions_cubit.dart';
import '../../question_survey.dart';
import 'package:flutter/material.dart';
import '../../colors/colors.dart';

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChoiseQuestionsCubit(),
          ),
          BlocProvider(
            create: (context) => AnimatedListView()..startAnimation(),
          ),
        ],
        child: BlocBuilder<AnimatedListView, bool>(
          builder: (_, isStarted) =>
              BlocBuilder<ChoiseQuestionsCubit, List<int>>(
            builder: (context, indexQuestion) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // index = 0 for the question index
                  questionSurvey[indexQuestion[0]].question,
                  style: const TextStyle(
                    fontSize: 26,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 60),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questionSurvey[indexQuestion[0]].choice.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      context
                          .read<ChoiseQuestionsCubit>()
                          //         question number  , answer
                          .isSelected(indexQuestion[0], index);
                      Future.delayed(const Duration(milliseconds: 500), () {
                        
                        context.read<AnimatedListView>().stopAnimation();
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        context.read<ChoiseQuestionsCubit>().nextQuestion(index);
                        context.read<AnimatedListView>().startAnimation();
                      });
                    },
                    borderRadius: BorderRadius.circular(19),
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      transform:
                          Matrix4.translationValues(isStarted ? 0 : 2000, 0, 0),
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
                    ),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
