import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../colors/colors.dart';
import '../global/custom_button.dart';
import '../global/custom_text_form_field.dart';
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
          const Text(
            'How tall are you?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: black,
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
                  controller: context.read<TextFormValidationCubit>().tallController,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Center(
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
          const Spacer(),
          CustomButton(
            label: 'Continue',
            horizontalPadding: 0,
            onPressed: () {
              context.read<TextFormValidationCubit>().tallDateValidate();
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
