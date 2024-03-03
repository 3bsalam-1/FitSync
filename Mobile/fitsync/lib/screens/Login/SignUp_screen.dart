import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/login_comp/custom_icon_button.dart';
import '../../shared/widgets/login_comp/custom_textformfield.dart';
import '../../shared/widgets/login_comp/loading_dialog.dart';
import '../../shared/widgets/login_comp/status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import '../../data/cubit/auth_cubit.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import 'login_screen.dart';
import 'verification_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
          } else if (state is AuthRegister) {
            Navigator.pop(context);
            AnimatedNavigator().push(
              context,
              VerificationPage(
                onPressed: () {
                  context.read<AuthCubit>().verifyCode();
                },
                email: context.read<AuthCubit>().email.text,
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: context.read<AuthCubit>().keyValidateSignup,
            autovalidateMode: context.read<AuthCubit>().autovalidateMode,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 60),
                    child: Text(
                      'Hi!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3, left: 19),
                    child: Text(
                      'Create a new account',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: gray2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  CustomizeTextFormField(
                    icon: IconlyLight.profile,
                    hintText: " User Name",
                    horizontalPadding: 25,
                    controller: context.read<AuthCubit>().username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'can Not be empty';
                      } else if (value.length < 4 || value.length > 15) {
                        return 'Letters must be between 4-15';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: Row(
                      children: [
                        Flexible(
                          child: CustomizeTextFormField(
                            hintText: "First Name",
                            horizontalPadding: 4,
                            icon: IconlyLight.profile,
                            controller: context.read<AuthCubit>().firstName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'can Not be empty';
                              } else if (value.length < 4 ||
                                  value.length > 12) {
                                return 'Letters must be between 4-12';
                              }
                              return null;
                            },
                          ),
                        ),
                        Flexible(
                          child: CustomizeTextFormField(
                            hintText: "Last Name",
                            horizontalPadding: 4,
                            icon: IconlyLight.profile,
                            controller: context.read<AuthCubit>().lastName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'can Not be empty';
                              } else if (value.length < 4 ||
                                  value.length > 12) {
                                return 'Letters must be between 4-12';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
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
                    height: 12,
                  ),
                  CustomizeTextFormField(
                    icon: IconlyLight.lock,
                    hintText: "Password",
                    horizontalPadding: 25,
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
                    height: 12,
                  ),
                  CustomizeTextFormField(
                    icon: IconlyLight.lock,
                    hintText: "Confirm Password",
                    horizontalPadding: 25,
                    controller: context.read<AuthCubit>().confirmPassword,
                    obscureText: context.read<AuthCubit>().isObscureConfirm,
                    suffixIcon: context.read<AuthCubit>().isObscureConfirm
                        ? IconlyLight.hide
                        : IconlyLight.show,
                    onPressed: () {
                      context.read<AuthCubit>().obscureCheckConfirm();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'can Not be empty';
                      } else if (value !=
                          context.read<AuthCubit>().password.text) {
                        return 'Password do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Checkbox(
                            activeColor: purple5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: const BorderSide(
                              color: gray2,
                              width: 2,
                            ),
                            value: context.read<AuthCubit>().agreePolicy,
                            onChanged: (value) {
                              context.read<AuthCubit>().checkAgreePolicy();
                            },
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'I‘ve read and agree with ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: gray2,
                                  ),
                                ),
                                Text(
                                  'terms pf service ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: purple5,
                                  ),
                                ),
                                Text(
                                  'and our',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: gray2,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'privacy policy ',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: purple5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    label: "Sign Up",
                    onPressed: () {
                      context.read<AuthCubit>().register();
                    },
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon_Button(
                        principle_widget: Image.asset(
                          "assets/images/Icons/google_icon.png",
                          width: 24,
                          height: 24,
                        ),
                        websiteUri: Uri.parse(
                          'https://fitsync.onrender.com/auth/google',
                        ),
                      ),
                      Icon_Button(
                        principle_widget: const Icon(
                          Icons.apple,
                          color: black,
                          size: 30,
                        ),
                      ),
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
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do you have an account? ",
                        style: TextStyle(
                          color: gray2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().username.clear();
                          context.read<AuthCubit>().firstName.clear();
                          context.read<AuthCubit>().lastName.clear();
                          context.read<AuthCubit>().email.clear();
                          context.read<AuthCubit>().password.clear();
                          context.read<AuthCubit>().confirmPassword.clear();
                          context.read<AuthCubit>().isObscure = true;
                          context.read<AuthCubit>().autovalidateMode =
                              AutovalidateMode.disabled;
                          AnimatedNavigator().pushAndRemoveUntil(
                            context,
                            const LoginPage(),
                          );
                        },
                        child: const Text(
                          "Sign in",
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
            ),
          );
        },
        ),
      );
  }
}
