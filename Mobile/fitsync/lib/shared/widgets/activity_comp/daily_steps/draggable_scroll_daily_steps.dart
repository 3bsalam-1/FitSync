import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../global/custom_animated_opacity.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
import 'circle_progress.dart';
import 'circle_progress_info.dart';
import 'custom_chart_line.dart';

class DraggableScrollDailySteps extends StatelessWidget {
  const DraggableScrollDailySteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
            const SizedBox(height: 10),
            Container(
              height: 7,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: gray7.withOpacity(0.7),
              ),
            ),
            const CustomAnimatedOpacity(
              child: CircleProgress(
                steps: '18,249',
                progress: 50,
              ),
            ),
            const CustomAnimatedOpacity(
              child: Row(
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
            ),
            BlocBuilder<SmartWatchCubit, SmartWatchState>(
              builder: (context, state) {
                final weekData = context.read<SmartWatchCubit>().smartWatchWeek;
                return CustomChartLine(data: weekData?.weekDataSteps);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
