import 'package:fitsync/shared/widgets/activity_comp/sleep_comp/sleep_information.dart';

import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/activity_comp/chart_data.dart';
import '../../shared/widgets/activity_comp/custom_chart_column.dart';
import '../../shared/widgets/activity_comp/sleep_comp/progress_bar_sleep_hours.dart';
import '../../shared/widgets/activity_comp/sleep_comp/sleep_hours.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class SleepActivityScreen extends StatelessWidget {
  const SleepActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(context, 'Sleep'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const SleepHours(
              title: 'Hours',
              basic: ' /8.00',
              current: '7.40',
            ),
            const Icon(
              Icons.nightlight_round_outlined,
              color: purple5,
              size: 30,
            ),
            const SizedBox(height: 20),
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
                  const SizedBox(height: 37),
                  const ProgressBarSleepHours(),
                  const SizedBox(height: 17),
                  SizedBox(
                    width: width * 0.84,
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SleepInformation(title: 'Deep sleep 43%', value: '3.18'),
                        SleepInformation(title: 'Light sleep 56%', value: '4.15'),
                        SleepInformation(title: 'Wake-up time', value: '0.07'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  const SleepHours(
                    title: 'Sleep assessment',
                    basic: ' /5.0',
                    current: '4.6',
                  ),
                  const Text(
                    'you slept better than 53% of users',
                    style: TextStyle(
                      color: gray10,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Analytics',
                      style: TextStyle(
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: CustomChartColumn(
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
