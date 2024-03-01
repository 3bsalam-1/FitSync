import 'package:fitsync/screens/Login/signup_screen.dart';
import 'package:fitsync/screens/home_main_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_icon_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../data/cubit/auth_cubit.dart';
import '../../shared/widgets/login_comp/loading_dialog.dart';
import '../../shared/widgets/login_comp/status_dialog.dart';
import 'forgot_password_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
          } else if (state is AuthLogin) {
            AnimatedNavigator().pushAndRemoveUntil(
              context,
              const HomeMainScreen(),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 60),
                  child: Text(
                    'Welcome Back !',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: black,
                      // fontFamily:
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4, left: 19, bottom: 35),
                  child: Text(
                    'Glad to see you again',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: gray2,
                      // fontFamily:
                    ),
                  ),
                ),
                CustomizeTextFormField(
                  icon: IconlyLight.message,
                  horizontalPadding: 25,
                  hintText: "Email",
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
                  height: 22,
                ),
                CustomizeTextFormField(
                  icon: IconlyLight.lock,
                  horizontalPadding: 25,
                  hintText: "Password",
                  controller: context.read<AuthCubit>().password,
                  obscureText: context.read<AuthCubit>().isObscure,
                  suffixIcon: context.read<AuthCubit>().isObscure
                      ? IconlyLight.hide
                      : IconlyLight.show,
                  onPressed: () {
                    context.read<AuthCubit>().obscureCheck();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'can Not be empty';
                    }
                    if (value.length < 8 || value.length > 12) {
                      return 'password length must be between 8-12';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 27),
                    child: TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().password.clear();
                        AnimatedNavigator().push(
                          context,
                          const ForgotPasswordPage(),
                        );
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: purple4,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                CustomButton(
                  label: "Log in",
                  onPressed: () {
                    context.read<AuthCubit>().signin();
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: Icon_Button(
                        principle_widget: Image.asset(
                          "assets/images/Icons/google_icon.png",
                          width: 24,
                          height: 24,
                        ),
                        websiteUri: Uri.parse(
                          'https://fitsync.onrender.com/auth/google',
                        ),
                      ),
                    ),
                    Icon_Button(
                        principle_widget: const Icon(
                      Icons.apple,
                      color: black,
                      size: 30,
                    )),
                    Icon_Button(
                      principle_widget: Image.asset(
                        "assets/images/Icons/facebook_icon.png",
                        width: 30,
                        height: 30,
                      ),
                      websiteUri: Uri.parse(
                        'https://fitsync.onrender.com/auth/facebook',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                          color: gray2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().email.clear();
                        context.read<AuthCubit>().password.clear();
                        context.read<AuthCubit>().isObscure = true;
                        AnimatedNavigator().push(
                          context,
                          const SignUp(),
                        );
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          color: purple5,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    )
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
