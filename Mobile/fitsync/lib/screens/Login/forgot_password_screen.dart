import 'package:fitsync/shared/colors/colors.dart';

import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_icon_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_textformfield.dart';
import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';

class forgotPasswordPage extends StatelessWidget {
  const forgotPasswordPage({super.key});

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
                      'Forgot your password?',
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
                      'Enter your information below or',
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
                padding: const EdgeInsets.only(top: 0.8, left: 19),
                child: Row(
                  children: [
                    Text(
                      'Login with another account',
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: custom_TextFormField(
                  icon_var: IconlyLight.message,
                  hint_text: "Email",
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 27),
                        child: Text(
                          'Send again?',
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
              CustomButton(label: "Send", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
