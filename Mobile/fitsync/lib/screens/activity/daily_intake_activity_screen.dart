import 'package:flutter/material.dart';
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
      body: const SizedBox(
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
                    SizedBox(height: 30),
                    Text(
                      'Today you have',
                      style: TextStyle(
                        color: black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Consumed ',
                          style: TextStyle(
                            color: black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // todo here add value of the
                        Text(
                          '500 cal',
                          style: TextStyle(
                            color: purple5,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            DraggableScrollIntake(),
          ],
        ),
      ),
    );
  }
}