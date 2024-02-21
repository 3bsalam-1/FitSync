import 'package:fitsync/screens/survey/writing_questions.dart/weight_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/global/custom_text_form_field.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../../shared/widgets/survey_comp/custom_snackbar.dart';

class DateBirthScreen extends StatelessWidget {
  const DateBirthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
        listener: (context, state) {
          if (state is BirthValidation) {
            if (state.errorText == null) {
              AnimatedNavigator().push(
                context,
                const WeightQuestionScreen(),
              );
            } else {
              customSnackBar(context, state.errorText!);
            }
          }
        },
        builder: (context, isValidated) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What’s Your Date of Birth?',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Flexible(
                    child: CustomTextFormField(
                      hintText: 'DD',
                      keyboardType: TextInputType.number,
                      controller: context
                          .read<TextFormValidationCubit>()
                          .birthDayController,
                    ),
                  ),
                  Flexible(
                    child: CustomTextFormField(
                      hintText: 'MM',
                      keyboardType: TextInputType.number,
                      controller: context
                          .read<TextFormValidationCubit>()
                          .birthMonthController,
                    ),
                  ),
                  Flexible(
                    child: CustomTextFormField(
                      hintText: 'YYY',
                      keyboardType: TextInputType.number,
                      controller: context
                          .read<TextFormValidationCubit>()
                          .birthYearController,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                label: 'Continue',
                horizontalPadding: 0,
                onPressed: () {
                  context.read<TextFormValidationCubit>().birthDateValidate();
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
