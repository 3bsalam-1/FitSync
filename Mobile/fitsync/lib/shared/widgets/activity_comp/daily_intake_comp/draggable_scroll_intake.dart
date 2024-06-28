import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../../data/models/workouts_model.dart';
import '../../global/custom_animated_opacity.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
import '../custom_button_activity.dart';
import 'daily_info_item.dart';
import 'progress_daily_gools.dart';

class DraggableScrollIntake extends StatelessWidget {
  const DraggableScrollIntake({super.key});

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
            final activeCalories = context
                    .read<SmartWatchCubit>()
                    .smartWatchData
                    ?.activeCalories ??
                0;
            final workouts = context.read<WorkoutsCubit>().challenges;
            final vitalInfo = context.read<SmartWatchCubit>().vitalInfodata;
            final double precent =
                ((activeCalories / totalCaloriesInWorkouts(workouts)) * 100) >
                        100
                    ? 100
                    : ((activeCalories / totalCaloriesInWorkouts(workouts)) *
                        100);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const SizedBox(height: 30),
                CustomAnimatedOpacity(
                  child: ProgressDailyGools(progress: precent),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomAnimatedOpacity(
                      child: DailyInfoItem(
                        label: 'Consumed',
                        value: "${activeCalories.ceilToDouble()}",
                      ),
                    ),
                    CustomAnimatedOpacity(
                      child: DailyInfoItem(
                        label: 'Intake',
                        value: '${vitalInfo?.inTake ?? 0}',
                      ),
                    ),
                    CustomAnimatedOpacity(
                      child: DailyInfoItem(
                        label: 'Active Hours',
                        value: '${vitalInfo?.activeHours ?? 0}',
                        icon: Icons.timeline_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                CustomAnimatedOpacity(
                  child: CustomButtonActivity(
                    label: 'Add Meal',
                    onPressed: () {
                      // todo here add meal
                    },
                    icon: Icons.apple_rounded,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }
}

double totalCaloriesInWorkouts(List<WorkoutsModel>? challenges) {
  double total = 0;
  if (challenges != null) {
    for (var element in challenges) {
      total += double.parse(element.calBurned);
    }
    return total;
  }
  return total;
}
