import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';
import '../../global/custom_animated_opacity.dart';

class ProgressDailyGools extends StatelessWidget {
  final double progress;

  const ProgressDailyGools({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 4),
        builder: (context, value, _) => Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 145,
              width: 145,
              child: CircularProgressIndicator(
                value: (value <= progress / 100) ? value : progress / 100,
                backgroundColor: gray3.withOpacity(0.1),
                color: purple5,
                strokeCap: StrokeCap.round,
                strokeWidth: 11.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 11),
                const Icon(
                  Icons.local_fire_department_sharp,
                  color: purple5,
                  size: 25,
                ),
                const SizedBox(height: 7),
                Text(
                  '$progress%',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: purple5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('of daily goals',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: gray15,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
