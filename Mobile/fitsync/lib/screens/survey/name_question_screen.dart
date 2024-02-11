import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/global/custom_text_form_field.dart';
import '../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import 'writing_questions.dart/date_birth_screen.dart';

class NameQuestionScreen extends StatelessWidget {
  const NameQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
          listener: (context, state) {
            if (state is NameValidation) {
              if (state.errorText == null) {
                AnimatedNavigator().push(
                  context,
                  const DateBirthScreen(),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: red,
                    content: Text(
                      state.errorText!,
                    ),
                  ),
                );
              }
            }
          },
          builder: (context, isValidated) {
            return Column(
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
                  controller:
                      context.read<TextFormValidationCubit>().nameController,
                  hintText: 'First name',
                ),
                const Spacer(),
                CustomButton(
                  label: 'Continue',
                  horizontalPadding: 0,
                  onPressed: () {
                    context.read<TextFormValidationCubit>().nameValidate();
                  },
                ),
                const SizedBox(height: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}
