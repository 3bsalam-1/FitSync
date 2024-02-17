import 'package:fitsync/shared/widgets/activity_comp/chart_data.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/daily_steps/circle_progress.dart';
import '../../shared/widgets/activity_comp/daily_steps/circle_progress_info.dart';
import '../../shared/widgets/activity_comp/daily_steps/custom_chart_line.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class DailyStepsActivityScreen extends StatelessWidget {
  const DailyStepsActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Daily Steps'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'You have walked',
              style: TextStyle(
                color: black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Row(
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
            const SizedBox(height: 60),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: gray4.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 7,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: gray7.withOpacity(0.7),
                    ),
                  ),
                  const CircleProgress(
                    steps: '18,249',
                    progress: 50,
                  ),
                  const Row(
                    children: [
                      Spacer(flex: 2),
                      CircleProgressInfo(
                        title: '31 kcal',
                        color: cyan3,
                        icon: Icons.local_fire_department_rounded,
                        progress: 30,
                      ),
                      Spacer(),
                      CircleProgressInfo(
                        title: '2 km',
                        color: purple5,
                        icon: Icons.location_on_rounded,
                        progress: 45,
                      ),
                      Spacer(),
                      CircleProgressInfo(
                        title: '50 min',
                        color: cyan4,
                        icon: Icons.access_time_filled_outlined,
                        progress: 65,
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  CustomChartLine(data: dataSteps),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
