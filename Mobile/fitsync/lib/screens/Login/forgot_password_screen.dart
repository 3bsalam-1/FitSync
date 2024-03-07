import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/login_comp/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../data/cubit/auth/auth_cubit.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import 'verification_screen.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
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
            state.showLoadingDialog(context);
          } else if (state is AuthSuccess) {
            state.showSucceussdialog(context);
          } else if (state is AuthFaliure) {
            state.showFaliure(context);
          } else if (state is AuthForgetPassword) {
            AnimatedNavigator().pushScale(
              context,
              VerificationPage(
                onPressed: () {
                  context.read<AuthCubit>().resetCode(context);
                },
                sendCodeAgain: () {
                  context.read<AuthCubit>().forgetPassword(context);
                },
                email: context.read<AuthCubit>().email.text,
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: black,
                  ),
                ),
              ),
              Container(
                width: 270,
                padding: const EdgeInsets.only(top: 4, left: 19),
                child: const Text(
                  'Enter your information below or Login with another account',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: gray2,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              CustomizeTextFormField(
                icon: IconlyLight.message,
                hintText: "Email",
                horizontalPadding: 25,
                controller: context.read<AuthCubit>().email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'can Not be empty';
                  }
                  bool isValidFormat = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value);
                  if (!isValidFormat) {
                    return 'Invalid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 27,
              ),
              CustomButton(
                label: "Reset Password",
                onPressed: () {
                  context.read<AuthCubit>().forgetPassword(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
