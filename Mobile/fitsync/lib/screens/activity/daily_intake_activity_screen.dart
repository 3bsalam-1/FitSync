import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/daily_intake_comp/draggable_scroll_intake.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class DailyIntakeActivityScreen extends StatelessWidget {
  const DailyIntakeActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Daily Intake'),
      backgroundColor: white,
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: CustomAnimatedOpacity(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Today you have',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Consumed ',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // todo here add value of the
                        Text(
                          '500 cal',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: purple5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const DraggableScrollIntake(),
          ],
        ),
      ),
    );
  }
}
