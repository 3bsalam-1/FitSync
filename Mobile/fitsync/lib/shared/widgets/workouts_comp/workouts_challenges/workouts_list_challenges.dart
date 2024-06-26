import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cubits_logic/workouts/counter_time_challenges.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../../data/models/workouts_model.dart';
import '../../../../services/convert_ms.dart';
import '../../../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../global/custom_translate_text.dart';
import '../../global/custom_image.dart';

class WorkoutsListChallenges extends StatelessWidget {
  final WorkoutsModel workouts;
  const WorkoutsListChallenges({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.38,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: workouts.exercisePlan.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: gray3,
              width: 1,
            ),
            color: white,
            boxShadow: [
              BoxShadow(
                color: gray4.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(
                imageUrl: context
                    .read<WorkoutsCubit>()
                    .workoutsImages![workouts.exercisePlan[index].trim()],
                height: 77,
                width: 79,
                fit: BoxFit.fill,
                errorColor: red,
                iconSize: 45,
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTranslateText(
                    workouts.exercisePlan[index],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  customTranslateText(
                    getTimeEachExercise(
                        workouts.planDurationMn, context)[index],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: gray4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> getTimeEachExercise(String totalTime, BuildContext context) {
    int seconds = (double.parse(totalTime) * 60).toInt();
    int length = workouts.exercisePlan.length;
    int singleTime = (seconds / length).floor();
    List<String> times = List.generate(
      length,
      (index) {
        if (index == 0) {
          return convertSecondsToMS(seconds - (length - 1) * singleTime);
        } else {
          return convertSecondsToMS(singleTime);
        }
      },
    );
    context.read<CounterTimeChallenges>().initalizeExerciseTimeSec(
          seconds,
          singleTime,
          length,
        );
    return times;
  }
}
