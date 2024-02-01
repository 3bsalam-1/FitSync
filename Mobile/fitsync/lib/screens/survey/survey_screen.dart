import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits_logic/survey_logic/choise_questions_cubit.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../shared/widgets/survey_comp/first_name_question.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoiseQuestionsCubit, List<int>>(
      builder: (_, indexQuestion) => Scaffold(
        appBar: customIconAppBar(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
        ),
        backgroundColor: white,
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: FirstNameQuestion(),
        ),
      ),
    );
  }
}
