import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_button.dart';
import 'login_screen.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/stars.png',
            height: 96,
            width: 108,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 40),
          Text(
            'Password changed',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: purple5,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: Text(
              'Your password has been changed succesfully',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: gray2,
              ),
            ),
          ),
          const SizedBox(height: 40),
          CustomButton(
            horizontalPadding: 70,
            label: 'Back to login',
            onPressed: () {
              AnimatedNavigator().pushReplacementScale(
                context,
                const LoginPage(),
              );
            },
          ),
        ],
      ),
    );
  }
}
