import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/custom_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_icon_button.dart';
import 'package:fitsync/shared/widgets/login_comp/custom_textformfield.dart';
import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

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
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 19),
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
              SizedBox(
                height: 27,
              ),
              CustomButton(label: "Verify", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
