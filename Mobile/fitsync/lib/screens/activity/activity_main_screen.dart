import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/navigation_page_cubit.dart';
import '../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/chart_data.dart';
import '../../shared/widgets/activity_comp/custom_chart_column.dart';
import '../../shared/widgets/activity_comp/custom_progress_challenge.dart';
import '../../shared/widgets/global/custom_menu_button.dart';
import '../../shared/widgets/workouts_comp/main_workouts/custom_date_item.dart';

class ActivityMainScreen extends StatelessWidget {
  const ActivityMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          automaticallyImplyLeading: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'Activity',
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            CustomMenuButton(
              labels: const ['Sleep', 'Daily Steps', 'Hydration', 'Daily Intake'],
              onSelected: (pageIndex) {
                context.read<NavigationPageCubit>().changePage(pageIndex + 5);
              },
              child: const Icon(
                Icons.format_align_left_sharp,
                color: purple2,
              ),
            ),
          ],
        ),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: BlocBuilder<SmartWatchCubit, SmartWatchState>(
              builder: (context, state) {
                final data = context.read<SmartWatchCubit>().smartWatchData;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomDayItem(),
                    const SizedBox(height: 22),
                    CustomChartColumn(
                      title: 'Sleep',
                      value:
                          '${data == null ? '0' : data.sleep.isNotEmpty ? data.sleep.last.ceil() : '0'} hours',
                      subTitle:
                          'The total sleep hours in one week is ${getTotalData(showSmartWatchDataWeekly(
                        data?.sleep,
                        data?.sleepDay,
                      ))} hours',
                      onPressed: () {
                        // todo
                      },
                      labelFormat: '{value}:00',
                      increaseData: 0.45,
                      interval: 2,
                      maxYlabel: 20,
                      minYlabel: 0,
                      data: showSmartWatchDataWeekly(
                        data?.sleep,
                        data?.sleepDay,
                      ),
                    ),
                    CustomChartColumn(
                      title: 'Steps',
                      value:
                          '${data == null ? '0' : data.walking.isNotEmpty ? data.walking.last.toInt() : '0'} m',
                      subTitle:
                          'The total steps in one week is ${getTotalData(showSmartWatchDataWeekly(
                        data?.steps,
                        data?.stepsDay,
                      ))} steps',
                      onPressed: () {
                        // todo
                      },
                      maxYlabel: data == null
                          ? 100
                          : data.walking.isNotEmpty
                              ? data.walking.reduce(max) + 100
                              : 100,
                      minYlabel: 0,
                      interval: 20,
                      increaseData: 2,
                      data: showSmartWatchDataWeekly(
                        data?.walking,
                        data?.walkingDay,
                      ),
                    ),
                    CustomChartColumn(
                      title: 'Water',
                      value:
                          '${data == null ? '0' : data.water.isNotEmpty ? data.water.last : '0'} L',
                      subTitle:
                          'The water intake in one week is ${getTotalData(showSmartWatchDataWeekly(
                        data?.water,
                        data?.waterDay,
                      ))} L',
                      onPressed: () {
                        // todo
                      },
                      labelFormat: '{value}L',
                      maxYlabel: data == null
                          ? 10
                          : data.water.isNotEmpty
                              ? data.water.reduce(max) + 2
                              : 10,
                      minYlabel: 0,
                      interval: 2,
                      increaseData: 0.5,
                      data: showSmartWatchDataWeekly(
                        data?.water,
                        data?.waterDay,
                      ),
                    ),
                    CustomChartColumn(
                      title: 'Calories',
                      value:
                          '${data == null ? '0' : data.calories.last.toStringAsFixed(2)} kcal',
                      subTitle:
                          'The total calories in one week is ${getTotalData(showSmartWatchDataWeekly(
                        data?.calories,
                        data?.caloriesDay,
                      ))} kcal',
                      onPressed: () {
                        // todo
                      },
                      interval: 200,
                      maxYlabel: data == null
                          ? 1000
                          : data.calories.reduce(max) + 200,
                      minYlabel: 0,
                      increaseData: 25,
                      data: showSmartWatchDataWeekly(
                        data?.calories,
                        data?.caloriesDay,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Challenges Progress',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: black,
                        fontWeight: FontWeight.w600,
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
