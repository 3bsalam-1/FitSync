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
        child: BlocBuilder<SmartWatchCubit, SmartWatchState>(
          builder: (context, state) {
            final data = context.read<SmartWatchCubit>().smartWatchData;
            final weekData = context.read<SmartWatchCubit>().smartWatchWeek;
            return Column(
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
                CustomAnimatedOpacity(
                  child: CircleProgress(
                    steps: '${data?.steps?? '_'}',
                    // todo add progress data
                    progress: 50,
                  ),
                ),
                CustomAnimatedOpacity(
                  child: Row(
                    children: [
                      const Spacer(flex: 2),
                      CircleProgressInfo(
                        title: '${data?.activeCalories?? '_'} kcal',
                        color: cyan3,
                        icon: Icons.local_fire_department_rounded,
                        // todo add progress data
                        progress: 30,
                      ),
                      const Spacer(),
                      CircleProgressInfo(
                        title: '${data?.distanceKM.toStringAsFixed(2)?? '_'} km',
                        color: purple5,
                        icon: Icons.location_on_rounded,
                        // todo add progress data
                        progress: 45,
                      ),
                      const Spacer(),
                      CircleProgressInfo(
                        title: '${data?.distanceM == null? '_': data!.distanceM*60.ceilToDouble()} min',
                        color: cyan4,
                        icon: Icons.access_time_filled_outlined,
                        // todo add progress data
                        progress: 65,
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
                CustomChartLine(data: weekData?.weekDataSteps),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
