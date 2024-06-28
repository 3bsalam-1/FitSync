import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/home_comp/parameters_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_translate_text.dart';

class WaterParametersScreen extends StatelessWidget {
  const WaterParametersScreen({super.key});

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
                "Water Parameters",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: black,

                  // fontFamily:
                ),
              ),
            ),
          ),
          backgroundColor: white,
        ),
        body: BlocConsumer<SmartWatchCubit, SmartWatchState>(
          listener: (context, state) {
            if (state is SmartWatchSaveWaterData) {
              state.showDialog(context);
            }
          },
          builder: (context, state) {
            final provider = context.read<SmartWatchCubit>();
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
                              'Quantity per day',
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
                        label: "Liters",
                        controller: provider.quantityGoal,
                        keyboardType: TextInputType.number,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 18, bottom: 12),
                        child: Row(
                          children: [
                            Text(
                              'Number of glasses per day',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ParametersTextFormField(
                        label: "Glasses",
                        controller: provider.glassesGoal,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height * (150 / 926),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 180),
                        child: CustomButton(
                          label: "Save",
                          onPressed: () {
                            provider.saveWaterParameters();
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
