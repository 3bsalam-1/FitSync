import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../../../services/pref.dart';
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
            final goalSteps = Prefs.getDouble("distance-goal") ?? 0;
            final steps = data?.steps.toDouble() ?? 0;
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
                    steps: '${data?.steps ?? '_'}',
                    // one km is equal to 1300 steps
                    progress: getProgressPrecent(
                      actualData: steps,
                      goal: goalSteps * 1300,
                    ),
                  ),
                ),
                CustomAnimatedOpacity(
                  child: Row(
                    children: [
                      const Spacer(flex: 2),
                      CircleProgressInfo(
                        title:
                            '${data != null ? (steps * 0.04).toStringAsPrecision(2) : '_'} kcal',
                        color: cyan3,
                        icon: Icons.local_fire_department_rounded,
                        // one step is burned 0.04 of calories
                        progress: getProgressPrecent(
                          actualData: steps * 0.04,
                          goal: goalSteps * 1300 * 0.04,
                        ),
                      ),
                      const Spacer(),
                      CircleProgressInfo(
                        title:
                            '${data != null ? (steps / 1300).toStringAsFixed(2) : '_'} km',
                        color: purple5,
                        icon: Icons.location_on_rounded,
                        // to convert steps to Km /1300
                        progress: getProgressPrecent(
                          actualData: steps / 1300,
                          goal: goalSteps,
                        ),
                      ),
                      const Spacer(),
                      CircleProgressInfo(
                        // one step means one second to convert it to mintues /60
                        title:
                            '${data == null ? '_' : (steps / 60).toStringAsFixed(2)} min',
                        color: cyan4,
                        icon: Icons.access_time_filled_outlined,
                        progress: getProgressPrecent(
                          actualData: steps / 60,
                          goal: ((goalSteps * 1300) / 60),
                        ),
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

double getProgressPrecent({
  required double actualData,
  required double goal,
}) {
  if (goal == 0) {
    return 100;
  } else {
    double progress = ((actualData / goal) * 100).truncateToDouble();
    if (progress > 100) {
      progress = 100;
    }
    return progress;
  }
}
