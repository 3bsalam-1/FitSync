import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/emergency_contact_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/home_comp/parameters_textfield.dart';

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
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25,
                          left: 18,
                          bottom: 12,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Phone Number',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ParametersTextFormField(
                        label: "phone",
                        controller: provider.phone,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (150 / 926),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 180),
                        child: CustomButton(
                          label: "Save",
                          onPressed: () {
                            provider.savePhoneNumber();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
