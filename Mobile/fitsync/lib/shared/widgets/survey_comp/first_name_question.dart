import '../../../screens/survey/age_question_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/cubit/text_form_validation.dart';
import '../global/animated_navigator.dart';
import '../global/custom_button.dart';
import '../../widgets/survey_comp/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class FirstNameQuestion extends StatelessWidget {
  const FirstNameQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<TextFormValidation, List<int>>(
      listener: (context, state) {
        if (state[0] == 1) {
          AnimatedNavigator().push(
            context,
            const AgeQuestionScreen(),
          );
        }
      }, 
      builder: (context, isValidated) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What’s Your Name?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
              const Spacer(),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
                hintText: 'First name',
              ),
              isValidated[0] == 0
              ? const Center(
                child: Text(
                  'Can Not Be Empty',
                  style: TextStyle(
                    color: red,
                    ),
                  ),
              ): const SizedBox(),
              const Spacer(),
              CustomButton(
                label: 'Continue',
                horizontalPadding: 0,
                onPressed: () {
                  context.read<TextFormValidation>().firstNameValidate(
                    formKey,
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
