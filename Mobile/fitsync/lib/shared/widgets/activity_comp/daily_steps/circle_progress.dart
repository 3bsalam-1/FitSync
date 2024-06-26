import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';
import '../../global/custom_translate_text.dart';

class CircleProgress extends StatelessWidget {
  final double progress;
  final String steps;

  const CircleProgress({
    super.key,
    required this.progress,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1),
        duration: const Duration(seconds: 3),
        builder: (context, value, _) => Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(
                value: (value <= progress / 100) ? value : progress / 100,
                backgroundColor: gray3.withOpacity(0.1),
                color: purple5,
                strokeWidth: 12.0,
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/Icons/sneakers.png',
                  height: 40,
                  width: 40,
                ),
                const SizedBox(height: 7),
                Text(
                  steps,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                customTranslateText(
                  'steps',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
