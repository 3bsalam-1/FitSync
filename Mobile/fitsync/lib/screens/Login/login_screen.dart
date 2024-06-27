import 'package:fitsync/cubits_logic/google_login/login_with_google.dart';
import 'package:fitsync/screens/Login/signup_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_icon_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../cubits_logic/global/navigation_page_cubit.dart';
import '../../cubits_logic/splash_screen_next_cubit.dart';
import '../../data/cubit/auth/auth_cubit.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import 'forgot_password_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: white,
          body: BlocConsumer<AuthCubit, AuthCubitState>(
            listener: (context, state) {
              if (state is InternetConnectivityOFF) {
                state.showConnectionError(context);
              } else if (state is AuthLoading) {
                state.showLoadingDialog(context);
              } else if (state is AuthFaliure) {
                state.showFaliure(context);
              } else if (state is AuthSuccess) {
                state.showSucceussdialog(context);
              } else if (state is AuthLogin) {
                context.read<NavigationPageCubit>().changePage(0);
                AnimatedNavigator().pushAndRemoveUntil(
                  context,
                  context.read<SplashScreenNextCubit>().loginNextScreen(),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: context.read<AuthCubit>().keyValidateSignin,
                  autovalidateMode: context.read<AuthCubit>().autovalidateMode,
                  child: CustomAnimatedOpacity(
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
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 4, left: 19, bottom: 35),
                          child: Text(
                            'Glad to see you again',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: gray2,
                            ),
                          ),
                        ),
                        CustomizeTextFormField(
                          icon: IconlyLight.message,
                          horizontalPadding: 25,
                          hintText: "Email",
                          controller: email,
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
                          controller: password,
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
                            } else if (value.length < 8 || value.length > 12) {
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
                                AnimatedNavigator().push(
                                  context,
                                  ForgotPasswordPage(
                                    userEmail: email.text,
                                  ),
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
                            FocusScope.of(context).unfocus();
                            context.read<AuthCubit>().signin(
                                  context,
                                  email: email.text,
                                  password: password.text,
                                );
                          },
                        ),
                        const SizedBox(height: 22),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon_Button(
                                  principle_widget: Image.asset(
                                    "assets/images/Icons/google_icon.png",
                                    width: 24,
                                    height: 24,
                                  ),
                                  onPressed: () async {
                                    await signInWithGoogle(context);
                                  }),
                              const SizedBox(width: 12),
                              Icon_Button(
                                principle_widget: const Icon(
                                  Icons.apple,
                                  color: black,
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 12),
                              Icon_Button(
                                principle_widget: Image.asset(
                                  "assets/images/Icons/facebook_icon.png",
                                  width: 30,
                                  height: 30,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
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
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<AuthCubit>().autovalidateMode =
                                    AutovalidateMode.disabled;
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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
