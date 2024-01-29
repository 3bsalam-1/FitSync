import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits_logic/cubit/animated_list_view.dart';
import '../../cubits_logic/cubit/choise_questions_cubit.dart';
import '../../shared/widgets/survey_comp/choice_questions.dart';
import '../../shared/widgets/survey_comp/first_name_question.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/survey_comp/age_question.dart';
import '../../shared/widgets/survey_comp/weight_question.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

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
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              //TODO here
            }, 
            icon: const Icon(
              Icons.arrow_circle_left,
              color: purple3,
              size: 40,
            ),
          ),
        ),
        backgroundColor: white,
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          // TODO here
          child: ChoiceQuestion() // WeightQuestion() //AgeQuestion(), //FirstNameQuestion(),
        ),
      ),
    );
  }
}