import 'package:fitsync/screens/survey/writing_questions.dart/weight_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/custom_button.dart';
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
              Center(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          AnimatedNavigator().pop(context);
                        },
                        child: DatePickerWidget(
                          looping: true,
                          firstDate: DateTime(DateTime.now().year - 90, 01, 01),
                          lastDate: DateTime(DateTime.now().year - 8, 1, 1),
                          initialDate: DateTime(1991, 10, 12),
                          dateFormat: "dd-MMM-yyyy",
                          locale: DatePicker.localeFromString('en'),
                          onChange: (DateTime newDate, _) {
                            context.read<TextFormValidationCubit>().updateBirthDateValue(
                              DateFormat('dd/MM/yyy').format(newDate).toString(),
                            );
                          },
                          pickerTheme: const DateTimePickerTheme(
                            itemTextStyle: TextStyle(
                              color: black,
                              fontSize: 19,
                            ),
                            dividerColor: purple5,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    context.read<TextFormValidationCubit>().birthDateController.isEmpty 
                    ? 'DD/MM/YYYY'
                    : context.read<TextFormValidationCubit>().birthDateController,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      color: gray3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
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
