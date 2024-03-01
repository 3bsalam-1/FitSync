import '../survey/welcome_survey_screen.dart';
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
  const VerificationPage({super.key});

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
              barrierDismissible: false,
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
              const WelcomeSurveyScreen(),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: black,
                        // fontFamily:
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4, left: 19),
                child: Row(
                  children: [
                    Text(
                      'we have sent you an email',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: gray2,
                        // fontFamily:
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    last: true,
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
              const Spacer(),
              CustomButton(
                label: "Verify",
                onPressed: () {
                  context.read<AuthCubit>().verifyCode();
                },
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
