import '../../../shared/widgets/survey_comp/writing_comp/body_weight_question.dart';
import '../../../shared/widgets/survey_comp/custom_snackbar.dart';
import 'tall_question_screen.dart';
import '../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';

class WeightQuestionScreen extends StatelessWidget {
  const WeightQuestionScreen({super.key});

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
          if (state is WeightValidation) {
            if (state.errorText == null) {
              AnimatedNavigator().push(
                context,
                const TallQuestionScreen(),
              );
            } else {
              customSnackBar(context, state.errorText!);
            }
          }
        },
        builder: (context, state) {
          if (state is WeightSwitchConverter) {
            return BodyWeightQuestion(
              label: state.isKgSelected? 'kg': 'bs', 
              isSelected: state.isKgSelected,
            );
          } else {
            return const BodyWeightQuestion(
              label: 'kg', 
              isSelected: true,
            );
          }
        },
      ),
    );
  }
}
