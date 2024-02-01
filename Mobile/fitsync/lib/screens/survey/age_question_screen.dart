import 'weight_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits_logic/survey_logic/text_form_validation.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../shared/widgets/survey_comp/custom_text_form_field.dart';

class AgeQuestionScreen extends StatelessWidget {
  const AgeQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      body: BlocConsumer<TextFormValidation, List<int>>(
        listener: (context, state) {
          if (state[1] == 1) {
            AnimatedNavigator().push(
              context,
              const WeightQuestionScreen(),
            );
          }
        }, 
        builder: (context, isValidated) => Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What’s Your Age?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                ),
                const Spacer(),
                CustomTextFormField(
                  hintText: '0',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                const Center(
                  child: Text(
                    'Years',
                    style: TextStyle(
                      fontSize: 26,
                      color: gray3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                isValidated[1] == 0
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
                    context.read<TextFormValidation>().ageValidate(formKey);
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}