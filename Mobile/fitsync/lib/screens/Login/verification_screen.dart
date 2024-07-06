import 'package:fitsync/screens/survey/welcome_survey_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/pref.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/cubit/auth/auth_cubit.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/login_comp/custom_otp_widget.dart';
import 'new_password_screen.dart';

class VerificationPage extends StatelessWidget {

  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: white,
        body: BlocConsumer<AuthCubit, AuthCubitState>(
          listener: (context, state) {
            if (state is InternetConnectivityOFF) {
              state.showConnectionError(context);
            } else if (state is AuthLoading) {
              FocusScope.of(context).unfocus();
              state.showLoadingDialog(context);
            } else if (state is AuthFaliure) {
              state.showFaliure(context);
            } else if (state is AuthSuccess) {
              state.showSucceussdialog(context);
            } else if (state is AuthLogin) {
              AnimatedNavigator().pushAndRemoveUntil(
                context,
                const WelcomeSurveyScreen(),
              );
            } else if (state is AuthResetCode) {
              AnimatedNavigator().push(
                context,
                const NewPasswordScreen(),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'We sent a reset link to ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: gray2,
                        ),
                      ),
                      Text(
                        Prefs.getString('email')!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'enter 6 digit code that mentioned in the email',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: gray2,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomOtpWidget(
                        first: true,
                        last: false,
                        controller: context.read<AuthCubit>().opt[0],
                      ),
                      CustomOtpWidget(
                        first: false,
                        last: false,
                        controller: context.read<AuthCubit>().opt[1],
                      ),
                      CustomOtpWidget(
                        first: false,
                        last: false,
                        controller: context.read<AuthCubit>().opt[2],
                      ),
                      CustomOtpWidget(
                        first: false,
                        last: false,
                        controller: context.read<AuthCubit>().opt[3],
                      ),
                      CustomOtpWidget(
                        first: false,
                        last: false,
                        controller: context.read<AuthCubit>().opt[4],
                      ),
                      CustomOtpWidget(
                        first: false,
                        last: true,
                        controller: context.read<AuthCubit>().opt[5],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    label: "Verify Code",
                    onPressed: () {
                      context.read<AuthCubit>().verifyCode(context);
                    },
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Haven’t got the email yet?',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: gray2,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().sendCodeAgain(context);
                        },
                        child: Text(
                          'Resend email',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: purple4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
