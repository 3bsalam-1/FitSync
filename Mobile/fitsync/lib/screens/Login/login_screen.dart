import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/custom_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_icon_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_textformfield.dart';
import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
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
                padding: const EdgeInsets.only(top: 4, left: 19),
                child: Row(
                  children: [
                    Text(
                      'Glad to see you again',
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
                  InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 27),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
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
              CustomButton(label: "Log in", onPressed: () {}),
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
                      websiteUri:
                          Uri.parse('https://fitsync.onrender.com/auth/google'),
                    ),
                  ),
                  Icon_Button(
                      principle_widget: Icon(
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
                    style: TextStyle(
                        color: gray2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Signup",
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
    );
  }
}
