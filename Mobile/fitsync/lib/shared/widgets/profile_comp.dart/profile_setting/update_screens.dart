import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../cubits_logic/survey_logic/choice_gender.dart';
import '../../../../cubits_logic/survey_logic/choise_questions_cubit.dart';
import '../../../../cubits_logic/survey_logic/text_form_validation_cubit.dart';
import '../../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../../../data/models/user_personal_info_model.dart';
import '../../../../services/pref.dart';
import '../../../colors/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/widgets/global/animated_navigator.dart';
import '../../../../shared/widgets/survey_comp/writing_comp/body_tall_question.dart';
import '../../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../../../shared/widgets/survey_comp/custom_snackbar.dart';
import '../../global/custom_animated_opacity.dart';
import '../../global/custom_button.dart';
import '../../survey_comp/choices_comp/choices_body_question.dart';
import '../../survey_comp/choices_comp/custom_card.dart';
import '../../survey_comp/choices_comp/question_survey.dart';
import '../../survey_comp/writing_comp/body_weight_question.dart';
import '../../survey_comp/writing_comp/writing_body_question.dart';

class UsernameUpdateScreen extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const UsernameUpdateScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      body: BlocConsumer<UserDataInfoCubit, UserDataInfoState>(
        listener: (context, state) {
          if (state is UserDataFailure) {
            state.showFaliure(context);
          }
          if (state is UserUpdateSuccess) {
            state.showSucceussdialog(context);
          }
          if (state is UserUpdateLoading) {
            state.showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          final provider = context.read<UserDataInfoCubit>();
          return WritingBodyQuestion(
            onPressed: () {
              // todo here
              provider.usernameValidate();
            },
            controller: provider.userNameController,
            labelQuestion: 'Please Enter Username?',
            labelField: Prefs.getStringList('user')![0],
            labelMeagure: '',
          );
        },
      ),
    );
  }
}

class HeightUpdateScreen extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const HeightUpdateScreen({
    super.key,
    required this.data,
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<TextFormValidationCubit, TextFormValidationState>(
            listener: (context, state) {
              if (state is TallValidation) {
                if (state.errorText == null) {
                  String height = context
                      .read<TextFormValidationCubit>()
                      .tallController
                      .text;
                  context.read<UserDataInfoCubit>().updateUserInfo(
                        weight: data!.weight,
                        height: double.parse(height),
                        birthdate: data!.birthdate.toIso8601String(),
                        gender: data!.gender,
                        systolicBP: data!.systolicBP,
                        diastolicBP: data!.diastolicBP,
                        kneePain: data!.kneePain == 0 ? false : true,
                        backPain: data!.backPain == 0 ? false : true,
                        cholesterolLevel: data!.cholesterolLevel,
                        bloodSugar: data!.bloodSugar,
                      );
                } else {
                  customSnackBar(context, state.errorText!);
                }
              }
            },
          ),
          BlocListener<UserDataInfoCubit, UserDataInfoState>(
            listener: (context, state) {
              if (state is UserDataFailure) {
                state.showFaliure(context);
              }
              if (state is UserUpdateSuccess) {
                state.showSucceussdialog(context);
              }
              if (state is UserUpdateLoading) {
                state.showLoadingDialog(context);
              }
            },
          ),
        ],
        child: BlocBuilder<TextFormValidationCubit, TextFormValidationState>(
          builder: (context, state) {
            if (state is TallSwitchConverter) {
              return BodyTallQuestion(
                label: state.isCmSelected ? 'cm' : 'ft',
                isSelected: state.isCmSelected,
              );
            } else {
              return const BodyTallQuestion(
                label: 'cm',
                isSelected: true,
              );
            }
          },
        ),
      ),
    );
  }
}

class WeightUpdateScreen extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const WeightUpdateScreen({
    super.key,
    required this.data,
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<TextFormValidationCubit, TextFormValidationState>(
            listener: (context, state) {
              if (state is WeightValidation) {
                if (state.errorText == null) {
                  String weight = context
                      .read<TextFormValidationCubit>()
                      .weightController
                      .text;
                  context.read<UserDataInfoCubit>().updateUserInfo(
                        weight: double.parse(weight),
                        height: data!.height,
                        birthdate: data!.birthdate.toIso8601String(),
                        gender: data!.gender,
                        systolicBP: data!.systolicBP,
                        diastolicBP: data!.diastolicBP,
                        kneePain: data!.kneePain == 0 ? false : true,
                        backPain: data!.backPain == 0 ? false : true,
                        cholesterolLevel: data!.cholesterolLevel,
                        bloodSugar: data!.bloodSugar,
                      );
                } else {
                  customSnackBar(context, state.errorText!);
                }
              }
            },
          ),
          BlocListener<UserDataInfoCubit, UserDataInfoState>(
            listener: (context, state) {
              if (state is UserDataFailure) {
                state.showFaliure(context);
              }
              if (state is UserUpdateSuccess) {
                state.showSucceussdialog(context);
              }
              if (state is UserUpdateLoading) {
                state.showLoadingDialog(context);
              }
            },
          ),
        ],
        child: BlocBuilder<TextFormValidationCubit, TextFormValidationState>(
          builder: (context, state) {
            if (state is WeightSwitchConverter) {
              return BodyWeightQuestion(
                label: state.isKgSelected ? 'kg' : 'bs',
                isSelected: state.isKgSelected,
              );
            } else {
              return const BodyWeightQuestion(
                label: 'kg',
                isSelected: true,
              );
            }
          },
        ),
      ),
    );
  }
}

class DateBirthUpdateScreen extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const DateBirthUpdateScreen({
    super.key,
    required this.data,
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<TextFormValidationCubit, TextFormValidationState>(
            listener: (context, state) {
              if (state is BirthValidation) {
                if (state.errorText == null) {
                  String birthdate = context
                      .read<TextFormValidationCubit>()
                      .birthDateController;
                  context.read<UserDataInfoCubit>().updateUserInfo(
                        weight: data!.weight,
                        height: data!.height,
                        birthdate: birthdate,
                        gender: data!.gender,
                        systolicBP: data!.systolicBP,
                        diastolicBP: data!.diastolicBP,
                        kneePain: data!.kneePain == 0 ? false : true,
                        backPain: data!.backPain == 0 ? false : true,
                        cholesterolLevel: data!.cholesterolLevel,
                        bloodSugar: data!.bloodSugar,
                      );
                } else {
                  customSnackBar(context, state.errorText!);
                }
              }
            },
          ),
          BlocListener<UserDataInfoCubit, UserDataInfoState>(
            listener: (context, state) {
              if (state is UserDataFailure) {
                state.showFaliure(context);
              }
              if (state is UserUpdateSuccess) {
                state.showSucceussdialog(context);
              }
              if (state is UserUpdateLoading) {
                state.showLoadingDialog(context);
              }
            },
          ),
        ],
        child: BlocBuilder<TextFormValidationCubit, TextFormValidationState>(
          builder: (context, isValidated) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAnimatedOpacity(
                  duration: const Duration(milliseconds: 700),
                  child: Text(
                    'What’s Your Date of Birth?',
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
                  child: Center(
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
                              firstDate:
                                  DateTime(DateTime.now().year - 90, 01, 01),
                              lastDate: DateTime(DateTime.now().year - 8, 1, 1),
                              initialDate: DateTime(1991, 10, 12),
                              dateFormat: "dd-MMM-yyyy",
                              locale: DatePicker.localeFromString('en'),
                              onChange: (DateTime newDate, _) {
                                context
                                    .read<TextFormValidationCubit>()
                                    .updateBirthDateValue(
                                      DateFormat('yyy-MM-dd').format(newDate),
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
                      child: CustomAnimatedOpacity(
                        duration: const Duration(milliseconds: 700),
                        child: Text(
                          context
                                  .read<TextFormValidationCubit>()
                                  .birthDateController
                                  .isEmpty
                              ? 'DD/MM/YYYY'
                              : context
                                  .read<TextFormValidationCubit>()
                                  .birthDateController,
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            color: gray3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
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
                      context
                          .read<TextFormValidationCubit>()
                          .birthDateValidate();
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BloodSugarUpdate extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const BloodSugarUpdate({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TextFormValidationCubit, TextFormValidationState>(
          listener: (context, state) {
            if (state is BloodSugarValidation) {
              if (state.errorText == null) {
                FocusScope.of(context).unfocus();
                String bloodSugar = context
                    .read<TextFormValidationCubit>()
                    .bloodSugarController
                    .text;
                context.read<UserDataInfoCubit>().updateUserInfo(
                      weight: data!.weight,
                      height: data!.height,
                      birthdate: data!.birthdate.toIso8601String(),
                      gender: data!.gender,
                      systolicBP: data!.systolicBP,
                      diastolicBP: data!.diastolicBP,
                      kneePain: data!.kneePain == 0 ? false : true,
                      backPain: data!.backPain == 0 ? false : true,
                      cholesterolLevel: data!.cholesterolLevel,
                      bloodSugar: double.parse(bloodSugar),
                    );
              } else {
                customSnackBar(context, state.errorText!);
              }
            }
          },
        ),
        BlocListener<UserDataInfoCubit, UserDataInfoState>(
          listener: (context, state) {
            if (state is UserDataFailure) {
              state.showFaliure(context);
            }
            if (state is UserUpdateSuccess) {
              state.showSucceussdialog(context);
            }
            if (state is UserUpdateLoading) {
              state.showLoadingDialog(context);
            }
          },
        ),
      ],
      child: BlocBuilder<TextFormValidationCubit, TextFormValidationState>(
        builder: (context, state) => WritingBodyQuestion(
          onPressed: () {
            context.read<TextFormValidationCubit>().bloodSugarValidate();
          },
          controller:
              context.read<TextFormValidationCubit>().bloodSugarController,
          labelQuestion: 'Please Enter Blood Sugar Level?',
          labelField: '0',
          labelMeagure: 'Mg/dL',
        ),
      ),
    );
  }
}

class SystolicBloodUpdate extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const SystolicBloodUpdate({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
      listener: (context, state) {
        if (state is SystolicBloodValidation) {
          if (state.errorText == null) {
            FocusScope.of(context).unfocus();
            // todo here
          } else {
            customSnackBar(context, state.errorText!);
          }
        }
      },
      builder: (context, state) => WritingBodyQuestion(
        onPressed: () {
          context.read<TextFormValidationCubit>().systolicBloodValidate();
        },
        controller: context.read<TextFormValidationCubit>().systolicController,
        labelQuestion: 'Enter systolic blood pressure?',
        labelField: '0',
        labelMeagure: 'SYS',
      ),
    );
  }
}

class DiastolicBloodUpdate extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const DiastolicBloodUpdate({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
      listener: (context, state) {
        if (state is DiastolicBloodValidation) {
          if (state.errorText == null) {
            FocusScope.of(context).unfocus();
            // todo here
          } else {
            customSnackBar(context, state.errorText!);
          }
        }
      },
      builder: (context, state) => WritingBodyQuestion(
        onPressed: () {
          context.read<TextFormValidationCubit>().diastolicBloodValidate();
        },
        controller: context.read<TextFormValidationCubit>().diastolicController,
        labelQuestion: ' Enter diastolic blood pressure?',
        labelField: '0',
        labelMeagure: 'DIA',
      ),
    );
  }
}

class CholesterolLevelUpdate extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const CholesterolLevelUpdate({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextFormValidationCubit, TextFormValidationState>(
      listener: (context, state) {
        if (state is CholesterolValidation) {
          if (state.errorText == null) {
            FocusScope.of(context).unfocus();
            // todo here
          } else {
            customSnackBar(context, state.errorText!);
          }
        }
      },
      builder: (context, state) => WritingBodyQuestion(
        onPressed: () {
          context.read<TextFormValidationCubit>().cholesterolValidate();
        },
        controller:
            context.read<TextFormValidationCubit>().cholesterolController,
        labelQuestion: 'Please Enter cholesterol level?',
        labelField: '0',
        labelMeagure: 'Mg/dL',
      ),
    );
  }
}

class ChoiceBackPainUpdate extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const ChoiceBackPainUpdate({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[2],
      questionIndex: 2,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[2];
        if (selectedAnswer == 0) {
          // todo NO here
        } else {
          // todo YES here
        }
      },
    );
  }
}

class ChoiceKneePainUpdate extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const ChoiceKneePainUpdate({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceBodyQuestion(
      question: questionSurvey[3],
      questionIndex: 3,
      onPress: () {
        int selectedAnswer = context.read<ChoiseQuestionsCubit>().answers[3];
        if (selectedAnswer == 0) {
          // todo NO here
        } else {
          // todo YES here
        }
      },
    );
  }
}

class GenderUpdateScreen extends StatelessWidget {
  final UserPersonalInfoGetModel? data;

  const GenderUpdateScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      body: BlocBuilder<ChoiceGender, int>(
        builder: (context, isSelected) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),
              Text(
                'What’s Your Gender ?',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: black,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
              ),
              const Spacer(),
              Center(
                child: CustomCard(
                  icon: Icons.male,
                  label: 'Male',
                  bgColor: isSelected == 0 ? purple5 : purple5.withOpacity(0.3),
                  onTap: () {
                    context.read<ChoiceGender>().isMale();
                  },
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: CustomCard(
                  icon: Icons.female,
                  label: 'Female',
                  bgColor: isSelected == 1 ? purple5 : purple5.withOpacity(0.3),
                  onTap: () {
                    context.read<ChoiceGender>().isFemale();
                  },
                ),
              ),
              const Spacer(),
              CustomButton(
                horizontalPadding: 20,
                label: 'Continue',
                onPressed: () {
                  if (isSelected != -1) {
                    // todo here
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
