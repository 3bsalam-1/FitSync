import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/daily_steps/draggable_scroll_daily_steps.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class DailyStepsActivityScreen extends StatelessWidget {
  const DailyStepsActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Daily Steps'),
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
                      'You have walked',
                      style: TextStyle(
                        color: black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // todo here add value of the
                        Text(
                          '40%',
                          style: TextStyle(
                            color: purple5,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' of your goal',
                          style: TextStyle(
                            color: black,
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
            DraggableScrollDailySteps(),
          ],
        ),
      ),
    );
  }
}
