import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/survey_comp/custom_snackbar.dart';
import 'tall_question_screen.dart';
import '../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../../cubits_logic/survey_logic/weight_switch_measure_cubit.dart';
import '../../../shared/widgets/survey_comp/custom_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../../shared/widgets/global/custom_text_form_field.dart';

class WeightQuestionScreen extends StatelessWidget {
  const WeightQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeightSwitchMeasureCubit(),
      child: Scaffold(
        appBar: customIconAppBar(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
        ),
        backgroundColor: white,
        body: BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
            listener: (context, state) {
          if (state is WeightValidation) {
            if (state.errorText == null) {
              AnimatedNavigator().push(
                context,
                const TallQuestionScreen(),
              );
            } else {
              customSnackBar(context, state.errorText!);
            }
          }
        }, builder: (context, isValidated) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocBuilder<WeightSwitchMeasureCubit,
                WeightSwitchMeasureInitial>(builder: (context, state) {
              return Column(
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
                  CustomTextFormField(
                    hintText: '0',
                    keyboardType: TextInputType.number,
                    controller: context
                        .read<TextFormValidationCubit>()
                        .weightController,
                  ),
                  Center(
                    child: CustomToggleSwitch(
                      onTap1: () {
                        // if the controller has value then convert it
                        if (context
                            .read<TextFormValidationCubit>()
                            .weightController
                            .text
                            .isNotEmpty) {
                          // convert from 1bs to kg
                          if (!state.isKgSelected) {
                            context
                                .read<WeightSwitchMeasureCubit>()
                                .convertToKg(
                                  context
                                      .read<TextFormValidationCubit>()
                                      .weightController,
                                );
                          }
                        }
                      },
                      isSelected: state.isKgSelected,
                      onTap2: () {
                        // if the controller has value then convert it
                        if (context
                            .read<TextFormValidationCubit>()
                            .weightController
                            .text
                            .isNotEmpty) {
                          // convert from kg to 1bs
                          if (state.isKgSelected) {
                            context
                                .read<WeightSwitchMeasureCubit>()
                                .convertToBs(
                                  context
                                      .read<TextFormValidationCubit>()
                                      .weightController,
                                );
                          }
                        }
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
              );
            }),
          );
        }),
      ),
    );
  }
}
