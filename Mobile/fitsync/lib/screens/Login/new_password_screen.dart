import '../../shared/widgets/global/custom_button.dart';
import 'password_changed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/cubit/auth/auth_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/login_comp/custom_textformfield.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            if (state is InternetConnectivityOFF) {
              state.showConnectionError(context);
            } else if (state is AuthLoading) {
              state.showLoadingDialog(context);
            } else if (state is AuthFaliure) {
              state.showFaliure(context);
            } else if (state is AuthSuccess) {
              state.showSucceussdialog(context);
            } else if (state is AuthLogin) {
              AnimatedNavigator().pushAndRemoveUntil(
                context,
                const PasswordChangedScreen(),
              );
            }
          },
          builder: (context, state) => Form(
            key: context.read<AuthCubit>().keyValidatePass,
            autovalidateMode: context.read<AuthCubit>().autovalidateMode,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set a new password',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Text(
                      'Create a new password. Ensure it differs from previous ones for security',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: gray2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomizeTextFormField(
                    icon: Icons.lock_outline,
                    hintText: "Password",
                    controller: password,
                    obscureText: context.read<AuthCubit>().isObscure,
                    suffixIcon: context.read<AuthCubit>().isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
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
                  const SizedBox(height: 25),
                  CustomizeTextFormField(
                    icon: Icons.lock_outline,
                    hintText: "Confirm Password",
                    controller: confirmPassword,
                    obscureText: context.read<AuthCubit>().isObscureConfirm,
                    suffixIcon: context.read<AuthCubit>().isObscureConfirm
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    onPressed: () {
                      context.read<AuthCubit>().obscureCheckConfirm();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'can Not be empty';
                      } else if (value != password.text) {
                        return 'Password do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    label: 'Update Password',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.read<AuthCubit>().resetPassword(
                            context,
                            password: password.text,
                            confirmPassword: confirmPassword.text,
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
