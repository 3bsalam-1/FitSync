import '../global/custom_button.dart';
import '../global/custom_text_form_field.dart';
import '../../colors/colors.dart';
import 'custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import '../global/animated_navigator.dart';

class WritingBodyQuestion extends StatelessWidget {
  final void Function() onPressed;
  final String labelQuestion;
  final String labelField;
  final String labelMeagure;

  const WritingBodyQuestion({
    super.key,
    required this.onPressed,
    required this.labelQuestion,
    required this.labelField,
    required this.labelMeagure,
  });

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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              labelQuestion,
              style: const TextStyle(
                color: black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            CustomTextFormField(hintText: labelField),
            Center(
              child: Text(
                labelMeagure,
                style: const TextStyle(
                  fontSize: 26,
                  color: gray3,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              label: 'Continue',
              onPressed: onPressed,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
