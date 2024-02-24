import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../colors/colors.dart';
import '../global/custom_button.dart';
import '../global/custom_text_form_field.dart';
import 'custom_toggle_switch.dart';

class BodyWeightQuestion extends StatelessWidget {
  final bool isSelected;
  final String label;

  const BodyWeightQuestion({
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
          Text(
            'What’s Your Weight?',
            style: GoogleFonts.poppins(
              fontSize: 26,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Row(
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
                      context.read<TextFormValidationCubit>().weightController,
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
          const SizedBox(height: 25),
          Center(
            child: CustomToggleSwitch(
              onTap1: () {
                context.read<TextFormValidationCubit>().convertToKg();
              },
              isSelected: isSelected,
              onTap2: () {
                context.read<TextFormValidationCubit>().convertToBs();
              },
            ),
          ),
          const Spacer(),
          CustomButton(
            label: 'Continue',
            horizontalPadding: 0,
            onPressed: () {
              context.read<TextFormValidationCubit>().weightValidate();
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
