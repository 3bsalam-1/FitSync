import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/activity_comp/sleep_comp/draggable_scroll_sleep.dart';
import '../../shared/widgets/activity_comp/sleep_comp/sleep_hours.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class SleepActivityScreen extends StatelessWidget {
  const SleepActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Sleep'),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30),
                    SleepHours(
                      title: 'Hours',
                      basic: ' /8.00',
                      current: '7.40',
                    ),
                    Icon(
                      Icons.nightlight_round_outlined,
                      color: purple5,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            DraggableScrollSleep(),
          ],
        ),
      ),
    );
  }
}
