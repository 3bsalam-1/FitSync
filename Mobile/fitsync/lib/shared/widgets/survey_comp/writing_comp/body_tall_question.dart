import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../../colors/colors.dart';
import '../../global/custom_animated_opacity.dart';
import '../../global/custom_button.dart';
import '../../global/custom_text_form_field.dart';
import 'custom_toggle_switch.dart';

class BodyTallQuestion extends StatelessWidget {
  final bool isSelected;
  final String label;

  const BodyTallQuestion({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            child: Text(
              'How tall are you?',
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: width * 0.47,
                  child: CustomTextFormField(
                    hintText: '0',
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    controller:
                        context.read<TextFormValidationCubit>().tallController,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          CustomAnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            child: Center(
              child: CustomToggleSwitch(
                text1: 'cm',
                onTap1: () {
                  context.read<TextFormValidationCubit>().convertToCm();
                },
                isSelected: isSelected,
                text2: 'ft',
                onTap2: () {
                  context.read<TextFormValidationCubit>().convertToFt();
                },
              ),
            ),
          ),
          const Spacer(),
          CustomAnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            child: CustomButton(
              label: 'Continue',
              horizontalPadding: 0,
              onPressed: () {
                context.read<TextFormValidationCubit>().tallDateValidate();
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
