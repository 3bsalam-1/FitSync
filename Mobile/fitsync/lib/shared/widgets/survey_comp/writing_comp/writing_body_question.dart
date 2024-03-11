import 'package:google_fonts/google_fonts.dart';

import '../../global/custom_animated_opacity.dart';
import '../../global/custom_button.dart';
import '../../global/custom_text_form_field.dart';
import '../../../colors/colors.dart';
import '../custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import '../../global/animated_navigator.dart';

class WritingBodyQuestion extends StatelessWidget {
  final void Function()? onPressed;
  final String labelQuestion;
  final String labelField;
  final String labelMeagure;
  final TextEditingController? controller;

  const WritingBodyQuestion({
    super.key,
    required this.onPressed,
    required this.labelQuestion,
    required this.labelField,
    required this.labelMeagure,
    required this.controller,
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            CustomAnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              child: Text(
                labelQuestion,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            CustomAnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              child: CustomTextFormField(
                hintText: labelField,
                controller: controller,
                keyboardType: TextInputType.number,
              ),
            ),
            CustomAnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              child: Center(
                child: Text(
                  labelMeagure,
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: gray3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(),
            CustomAnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              child: CustomButton(
                label: 'Continue',
                onPressed: onPressed,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
