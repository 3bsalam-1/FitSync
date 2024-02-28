import 'package:fitsync/screens/Home/home_screen.dart';
import 'package:fitsync/screens/Login/SignUp_screen.dart';
import 'package:fitsync/screens/Login/forgot_password_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';

import 'package:fitsync/shared/widgets/login_comp/custom_icon_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iconly/iconly.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AnimatedNavigator().pop(context);
              },
              icon: Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              )),
          backgroundColor: white,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        'Welcome Back !',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: black,
                          // fontFamily:
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 19),
                  child: Row(
                    children: [
                      Text(
                        'Glad to see you again',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: gray2,
                          // fontFamily:
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 40),
                  child: custom_TextFormField(
                    icon_var: IconlyLight.message,
                    hint_text: "Email",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                custom_TextFormField(
                  icon_var: IconlyLight.lock,
                  hint_text: "Password",
                  suffix_icon: IconlyLight.hide,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          AnimatedNavigator().push(context, forgotPasswordPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 27),
                          child: Text(
                            'Forgot Password',
                            style: GoogleFonts.poppins(
                                color: gray4,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 27,
                ),
                CustomButton(
                    label: "Log in",
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: white,
                              content: Container(
                                height: MediaQuery.of(context).size.height *
                                    (210 / 926),
                                width: MediaQuery.of(context).size.width *
                                    (327 / 428),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image.asset(
                                  "assets/images/login_success.png",
                                  scale: 1,
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You have logged in",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                        color: gray15,

                                        // fontFamily:
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "successfully",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                        color: gray15,

                                        // fontFamily:
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomButton(
                                  label: "Continue",
                                  onPressed: () {
                                    AnimatedNavigator().pushAndRemoveUntil(
                                        context, HomePage());
                                  },
                                  horizontalPadding: 0,
                                )
                              ],
                            );
                          });
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon_Button(
                      principle_widget: Image.asset(
                        "assets/images/Icons/google_icon.png",
                        width: 24,
                        height: 24,
                      ),
                      websiteUri:
                          Uri.parse('https://fitsync.onrender.com/auth/google'),
                    ),
                    Icon_Button(
                        principle_widget: Image.asset(
                          "assets/images/Icons/facebook_icon.png",
                          width: 30,
                          height: 30,
                        ),
                        websiteUri: Uri.parse(
                            'https://fitsync.onrender.com/auth/facebook')),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: GoogleFonts.poppins(
                          color: gray2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        AnimatedNavigator().push(context, signup());
                      },
                      child: Text(
                        "Signup",
                        style: GoogleFonts.poppins(
                            color: purple5,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
