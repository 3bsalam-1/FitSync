import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitsync/data/repository/google_login.dart';
import 'package:fitsync/screens/Home/home_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Icon_Button extends StatelessWidget {
  Widget principle_widget;
  //final websiteUri;
  final void Function()? onPressed;
  Icon_Button({
    super.key,
    required this.principle_widget,
    //this.websiteUri,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(56, 56),
          shape: CircleBorder(),
          backgroundColor: gray5,
        ),
        child: principle_widget,
        onPressed: onPressed,
      ),
    );
  }
}

