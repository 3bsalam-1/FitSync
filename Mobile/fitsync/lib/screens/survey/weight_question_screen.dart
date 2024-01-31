import 'choice_questions_screen.dart';
import '../../cubits_logic/cubit/weight_switch_measure_cubit.dart';
import '../../shared/widgets/survey_comp/custom_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits_logic/cubit/text_form_validation.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../shared/widgets/survey_comp/custom_text_form_field.dart';

class WeightQuestionScreen extends StatelessWidget {
  const WeightQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => WeightSwitchMeasureCubit(),
      child: Scaffold(
        appBar: customIconAppBar(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
        ),
        body: BlocConsumer<TextFormValidation, List<int>>(
          listener: (context, validate) {
          if (validate[2] == 1) {
            AnimatedNavigator().push(
              context,
              const ChoiceQuestionScreen(),
            );
          }
        }, builder: (context, isValidated) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: BlocBuilder<WeightSwitchMeasureCubit,
                  WeightSwitchMeasureInitial>(builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'What’s Your Weight?',
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
                      controller: state.controller,
                    ),
                    Center(
                      child: CustomToggleSwitch(
                        onTapkg: () {
                          // if the controller has value then convert it
                          if (state.controller.text.isNotEmpty) {
                            // convert from 1bs to kg
                            if (!state.isKgSelected) {
                              context
                                  .read<WeightSwitchMeasureCubit>()
                                  .convertToKg(state.controller);
                            }
                          }
                        },
                        isSelected: state.isKgSelected,
                        onTapBs: () {
                          // if the controller has value then convert it
                          if (state.controller.text.isNotEmpty) {
                            // convert from kg to 1bs
                            if (state.isKgSelected) {
                              context
                                  .read<WeightSwitchMeasureCubit>()
                                  .convertToBs(state.controller);
                            }
                          }
                        },
                      ),
                    ),
                    isValidated[2] == 0
                        ? const Center(
                            child: Text(
                              'Can Not Be Empty',
                              style: TextStyle(
                                color: red,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const Spacer(),
                    CustomButton(
                      label: 'Continue',
                      horizontalPadding: 0,
                      onPressed: () {
                        context
                            .read<TextFormValidation>()
                            .weightValidate(formKey);
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
