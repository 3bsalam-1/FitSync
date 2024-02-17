import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/chart_data.dart';
import '../../shared/widgets/activity_comp/custom_chart_column.dart';
import '../../shared/widgets/activity_comp/custom_progress_challenge.dart';
import '../../shared/widgets/global/custom_menu_button.dart';
import '../../shared/widgets/workouts_comp/main_workouts/custom_date_item.dart';
import 'daily_intake_activity_screen.dart';
import 'daily_steps_activity_screen.dart';
import 'hydration_activity_screen.dart';
import 'sleep_activity_screen.dart';

class ActivityMainScreen extends StatelessWidget {
  const ActivityMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Activity',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: black,
          ),
        ),
        actions: const [
          CustomMenuButton(
            labels: ['Sleep', 'Daily Steps', 'Hydration', 'Daily Intake'],
            screens: [
              SleepActivityScreen(),
              DailyStepsActivityScreen(),
              HydrationActivityScreen(),
              DailyIntakeActivityScreen(),
            ],
          ),
        ],
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDayItem(),
              const SizedBox(height: 22),
              CustomChartColumn(
                title: 'Sleep',
                subTitle: 'you slept better the last 4 weeks',
                onPressed: () {
                  // todo
                },
                labelFormat: '{value}:00',
                increaseData: 0.24,
                maxYlabel: 10,
                minYlabel: 5,
                data: dataSleep,
              ),
              CustomChartColumn(
                title: 'Steps',
                subTitle:
                    'The number of steps you took per day was higher over the last 4 weeks',
                onPressed: () {
                  // todo
                },
                maxYlabel: 9000,
                minYlabel: 4000,
                increaseData: 200,
                data: dataSteps,
              ),
              CustomChartColumn(
                title: 'Water',
                subTitle:
                    'The liter of water you took per day was higher over the last 4 weeks',
                onPressed: () {
                  // todo
                },
                labelFormat: '{value}L',
                maxYlabel: 5,
                minYlabel: 0,
                interval: 1,
                increaseData: 0.2,
                data: dataWater,
              ),
              CustomChartColumn(
                title: 'Calories',
                subTitle:
                    'The number of calories you burned per day was balanced  over the last 4 weeks',
                onPressed: () {
                  // todo
                },
                maxYlabel: 0,
                minYlabel: 1600,
                increaseData: 70,
                data: dataCalories,
              ),
              const SizedBox(height: 30),
              const Text(
                'Challenges Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
              const SizedBox(height: 22),
              const CustomProgressChallenge(
                title: '12 Days',
                subTitle: '15 Days Jump Rope Challenge',
                progress: 'In Progress',
                progressColor: gold3,
                icon: Icons.check,
                progressPrecent: 40,
              ),
              const CustomProgressChallenge(
                title: '30 Days',
                subTitle: '30 Days No Soda Challenge',
                progress: 'Completed',
                progressColor: green,
                icon: Icons.check,
                progressPrecent: 100,
              ),
              const CustomProgressChallenge(
                title: '20 Days',
                subTitle: '30 Days Push Up Challenge',
                progress: 'Halted',
                progressColor: red3,
                icon: Icons.clear_sharp,
                progressPrecent: 65,
              ),
              const CustomProgressChallenge(
                title: '30 Days',
                subTitle: '7 Days Fruit Fast Challenge',
                progress: 'Completed',
                progressColor: green,
                icon: Icons.check,
                progressPrecent: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
