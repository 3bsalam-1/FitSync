import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';

class RestChallengeScreen extends StatelessWidget {
  const RestChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Text(
              'Take Rest!',
              style: GoogleFonts.poppins(
            fontSize: 40,
            color: purple5,
            fontWeight: FontWeight.w800,
          ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1),
              duration: const Duration(seconds: 20),
              builder: (context, value, _) {
                int seconds = (value * 20).toInt();
                return Text(
                  '00:${seconds <= 9 ? '0$seconds' : seconds}',
                  style: GoogleFonts.poppins(
            fontSize: 35,
            color: black,
            fontWeight: FontWeight.w600,
          ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 22),
              child: Divider(
                color: gray7,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Next Movement(2/7)',
                style: GoogleFonts.poppins(
            fontSize: 20,
            color: gray7,
            fontWeight: FontWeight.w600,
          ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Cow Pose',
                style: GoogleFonts.poppins(
            fontSize: 20,
            color: black,
            fontWeight: FontWeight.w600,
          ),
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/start_challenge.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            CustomButton(
              label: 'Skip Rest',
              onPressed: () {
                // todo Skip Rest
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
