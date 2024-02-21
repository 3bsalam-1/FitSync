import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';
import '../../global/custom_animated_opacity.dart';

class ProgressBarSleepHours extends StatelessWidget {
  const ProgressBarSleepHours({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomAnimatedOpacity(
      child: SizedBox(
        width: width * 0.84,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 43,
              width: width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                gradient: const LinearGradient(
                  colors: [
                    purple6,
                    purple6,
                    cyan2,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [
                  const Spacer(flex: 2),
                  Container(
                    width: 30,
                    height: 43,
                    color: gray4.withOpacity(0.3),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 50,
                    height: 43,
                    color: gray4.withOpacity(0.3),
                  ),
                  const Spacer(),
                  const VerticalDivider(
                    color: white,
                    thickness: 1.6,
                  ),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 43,
                    color: gray4.withOpacity(0.3),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 30,
                    height: 43,
                    color: gray4.withOpacity(0.3),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '22:32 PM',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: gray10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '5:08 AM',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: gray10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
