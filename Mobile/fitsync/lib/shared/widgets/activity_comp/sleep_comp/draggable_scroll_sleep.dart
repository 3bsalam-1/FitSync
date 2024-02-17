import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
import '../chart_data.dart';
import '../custom_chart_column.dart';
import 'progress_bar_sleep_hours.dart';
import 'sleep_hours.dart';
import 'sleep_information.dart';

class DraggableScrollSleep extends StatelessWidget {
  const DraggableScrollSleep({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: height * 0.71),
        duration: const Duration(milliseconds: 800),
        builder: (context, value, _) {
          return AnimatedContainer(
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 600),
            width: double.maxFinite,
            height: value,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            margin: const EdgeInsets.only(top: 20),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                        SleepInformation(
                            title: 'Deep sleep 43%', value: '3.18'),
                        SleepInformation(
                            title: 'Light sleep 56%', value: '4.15'),
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
          );
        });
  }
}
