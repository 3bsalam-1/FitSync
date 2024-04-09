import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/navigation_page_cubit.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
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
              Icons.menu_outlined,
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
                    subTitle: 'you slept better the last 4 weeks',
                    onPressed: () {
                      // todo
                    },
                    labelFormat: '{value}:00',
                    increaseData: 0.45,
                    maxYlabel: 10,
                    minYlabel: 2,
                    data: showSmartWatchDataWeekly(
                      data?.sleep,
                      data?.sleepDay,
                    ),
                  ),
                  CustomChartColumn(
                    title: 'Steps',
                    value:
                        '${data == null ? '0' : data.steps.isNotEmpty ? data.steps.last : '0'} m',
                    subTitle:
                        'The number of steps you took per day was higher over the last 4 weeks',
                    onPressed: () {
                      // todo
                    },
                    maxYlabel: 50,
                    minYlabel: 0,
                    interval: 10,
                    increaseData: 2,
                    data: showSmartWatchDataWeekly(
                      data?.steps,
                      data?.stepsDay,
                    ),
                  ),
                  CustomChartColumn(
                    title: 'Water',
                    value:
                        '${data == null ? '0' : data.water.isNotEmpty ? data.water.last : '0'} L',
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
                        'The number of calories you burned per day was balanced  over the last 4 weeks',
                    onPressed: () {
                      // todo
                    },
                    interval: 200,
                    maxYlabel: 1200,
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
    );
  }
}
