import 'package:fitsync/screens/Home/home_screen.dart';
import 'package:fitsync/screens/Login/login_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_icon_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool start = true;
  int downloadProgress = 0;
  String label = "Analyzing Your data";

  void download() async {
    setState(() {});
    while (downloadProgress < 100) {
      downloadProgress += 10;
      setState(() {});
      if (downloadProgress >= 0 && downloadProgress <= 60) {
        label = "Analyzing Your data";
      }
      if (downloadProgress >= 61 && downloadProgress <= 99) {
        label = "Creating your plan";
      }
      if (downloadProgress == 100) {
        start = false;
        setState(() {});
        break;
      }
    }
  }

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
                        'Hi!',
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
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 19),
                  child: Row(
                    children: [
                      Text(
                        'Create a new account',
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
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 30),
                  child: custom_TextFormField(
                    icon_var: IconlyLight.profile,
                    hint_text: "First Name",
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                custom_TextFormField(
                  icon_var: IconlyLight.profile,
                  hint_text: "Last Name",
                ),
                SizedBox(
                  height: 27,
                ),
                custom_TextFormField(
                  icon_var: IconlyLight.message,
                  hint_text: "Email",
                ),
                SizedBox(
                  height: 27,
                ),
                custom_TextFormField(
                  icon_var: IconlyLight.lock,
                  hint_text: "Password",
                  suffix_icon: IconlyLight.hide,
                ),
                SizedBox(
                  height: 35,
                ),
                CustomButton(
                    label: "Sign in",
                    onPressed: () {
                      download();
                      if (start) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: white,
                                content: Container(
                                  height: MediaQuery.of(context).size.height *
                                      (260 / 926),
                                  width: MediaQuery.of(context).size.width *
                                      (327 / 428),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: CircularPercentIndicator(
                                    backgroundColor: gray20.withOpacity(0.15),
                                    radius: 90.0,
                                    lineWidth: 18.0,
                                    percent: (downloadProgress / 100),
                                    progressColor: green,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: Text(
                                      "$downloadProgress%",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26,
                                        color: green1,
                                      ),
                                    ),
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$label",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                          color: green1,

                                          // fontFamily:
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  )
                                ],
                              );
                            });
                      }
                      if (!start) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: white,
                                content: Container(
                                  height: MediaQuery.of(context).size.height *
                                      (260 / 926),
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
                                        "Creating your plan",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22,
                                          color: green1,

                                          // fontFamily:
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  )
                                ],
                              );
                            });
                      }
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you have an account? ",
                      style: TextStyle(
                          color: gray2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        AnimatedNavigator().push(context, loginPage());
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
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
