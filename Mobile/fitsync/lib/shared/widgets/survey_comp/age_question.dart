import 'package:flutter/material.dart';
import '../../colors/colors.dart';
import '../custom_button.dart';
import 'custom_text_form_field.dart';

class AgeQuestion extends StatelessWidget {
  const AgeQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const CustomTextFormField(
          hintText: '0',
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