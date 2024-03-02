import 'package:google_fonts/google_fonts.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/cubit/auth_cubit.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/login_comp/custom_otp_widget.dart';
import '../../shared/widgets/login_comp/loading_dialog.dart';
import '../../shared/widgets/login_comp/status_dialog.dart';

class VerificationPage extends StatelessWidget {
  final void Function()? onPressed;
  final String email;
  final Widget nextScreen;

  const VerificationPage({
    super.key,
    required this.onPressed,
    required this.email,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: purple3,
            size: 40,
          ),
        ),
        backgroundColor: white,
      ),
      body: BlocConsumer<AuthCubit, AuthCubitState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => const LoadingDialog(),
            );
          } else if (state is AuthFaliure) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (_) => StatusDialog(
                color: red,
                message: state.message,
                icon: Icons.clear,
              ),
            );
          } else if (state is AuthSuccess) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (_) => StatusDialog(
                color: green2,
                message: state.message,
                icon: Icons.check,
              ),
            );
          } else if (state is AuthWentWrong) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: red,
                content: Text(state.message),
              ),
            );
          } else if (state is AuthLogin) {
            AnimatedNavigator().pushAndRemoveUntil(
              context,
              nextScreen,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      email,
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
                  onPressed: onPressed,
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
                        context.read<AuthCubit>().sendCodeAgain();
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
    );
  }
}
