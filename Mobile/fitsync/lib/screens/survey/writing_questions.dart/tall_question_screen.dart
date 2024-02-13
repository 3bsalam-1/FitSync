import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/body_tall_question.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../../shared/widgets/survey_comp/custom_snackbar.dart';
import '../choice_questions.dart/choice_questions_screen.dart';

class TallQuestionScreen extends StatelessWidget {
  const TallQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
        listener: (context, state) {
          if (state is TallValidation) {
            if (state.errorText == null) {
              AnimatedNavigator().push(
                context,
                const ChoiceExperienceQuestion(),
              );
            } else {
              customSnackBar(context, state.errorText!);
            }
          }
        },
        builder: (context, state) {
          if (state is TallSwitchConverter) {
            return BodyTallQuestion(
              label: state.isCmSelected? 'cm': 'ft', 
              isSelected: state.isCmSelected,
            );
          } else {
            return const BodyTallQuestion(
              label: 'cm', 
              isSelected: true,
            );
          }
        },
      ),
    );
  }
}
