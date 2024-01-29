import '../global/custom_button.dart';
import '../../widgets/survey_comp/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class FirstNameQuestion extends StatelessWidget {
  const FirstNameQuestion({super.key});

  @override
  Widget build(BuildContext context) {
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
        const CustomTextFormField(
          hintText: 'First name',
        ),
        const Spacer(),
        CustomButton(
          label: 'Continue',
          horizontalPadding: 0,
          onPressed: () {
            // TODO
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
