import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/emergency_contact_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../shared/widgets/global/custom_translate_text.dart';
import '../../shared/widgets/global/custom_button.dart';

class EmergencyContact extends StatelessWidget {
  const EmergencyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: CustomAnimatedOpacity(
            child: IconButton(
              onPressed: () {
                AnimatedNavigator().pop(context);
              },
              icon: const Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CustomAnimatedOpacity(
              child: Text(
                "Emergency Contact",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: black,
                ),
              ),
            ),
          ),
          backgroundColor: white,
        ),
        body: BlocConsumer<EmergencyContactCubit, EmergencyContactState>(
          listener: (context, state) {
            if (state is EmptyEmergencyContact) {
              state.showDialog(context);
            }
            if (state is PermissionDeniedEmergencyContact) {
              state.showDialog(context);
            }
            if (state is SaveEmergencyContact) {
              state.showDialog(context);
            }
          },
          builder: (context, state) {
            final provider = context.read<EmergencyContactCubit>();
            return CustomAnimatedOpacity(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: GoogleFonts.poppins(
                        color: gray2,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: gray2,
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 10,
                            top: 10,
                            left: 0,
                            child: Container(
                              height: 30,
                              width: 115,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    CupertinoIcons.chevron_down,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                debugPrint(number.phoneNumber);
                              },
                              onInputValidated: (value) {
                                provider.checkValidation(value);
                              },
                              selectorTextStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              selectorConfig: const SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                                setSelectorButtonAsPrefixIcon: false,
                                leadingPadding: 10,
                                trailingSpace: true,
                              ),
                              initialValue: PhoneNumber(isoCode: 'EG'),
                              textFieldController: provider.phone,
                              formatInput: false,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              ),
                              inputDecoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.start,
                              ),
                              textStyle: const TextStyle(color: black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      label: "Save",
                      onPressed: () {
                        provider.savePhoneNumber();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
