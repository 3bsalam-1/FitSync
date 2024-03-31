import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubits_logic/workouts/counter_time_challenges.dart';
import '../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../shared/widgets/global/custom_animated_opacity.dart';
import '../../home_main_screen.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import '../workouts_view_challenge.dart';

class CongratulationsScreen extends StatelessWidget {
  final int currentWorkoutIndex;

  const CongratulationsScreen({
    super.key,
    required this.currentWorkoutIndex,
  });

  @override
  Widget build(BuildContext context) {
    final workouts = context.read<WorkoutsCubit>().dataLevel;
    final provider = context.read<CounterTimeChallenges>();
    return Scaffold(
      appBar: customIconAppBar(onPressed: () {
        AnimatedNavigator().pop(context);
      }),
      backgroundColor: white,
      body: Column(
        children: [
          CustomAnimatedOpacity(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                provider.finishedExercises < provider.exerciseTimeSec.length~/2
                ? gray
                : provider.finishedExercises < provider.exerciseTimeSec.length
                ? gray.withOpacity(0.2)
                : Colors.transparent, 
                BlendMode.color,
              ),
              child: Image.asset(
                'assets/images/prize.png',
                width: 230,
                height: 280,
                fit: BoxFit.fill,
              ),
            ),
          ),
          CustomAnimatedOpacity(
            child: Text(
              provider.finishedExercises < provider.exerciseTimeSec.length~/2
              ?'Keep going' 
              : provider.finishedExercises < provider.exerciseTimeSec.length
              ? 'Keep up'
              :'Congratulations!',
              style: GoogleFonts.poppins(
                fontSize: 35,
                color: gold2,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          CustomAnimatedOpacity(
            child: Text(
              provider.finishedExercises < provider.exerciseTimeSec.length~/2
              ?'You can finish the challenge' 
              : provider.finishedExercises < provider.exerciseTimeSec.length
              ? 'You Almost to finish the challenge'
              :'You have completed the workout',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(),
          CustomAnimatedOpacity(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                congratulateData(
                  title: 'workout',
                  value: '${provider.finishedExercises}',
                ),
                congratulateData(
                  title: 'Cal',
                  value: provider.calBurned,
                ),
                congratulateData(
                  title: 'Minutes',
                  value: '${provider.totalExerciseTime}',
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomAnimatedOpacity(
            child: CustomButton(
              label: 'Next workout',
              horizontalPadding: 30,
              colors: currentWorkoutIndex != workouts.length - 1
                  ? [cyan, purple, purple]
                  : [gray14, gray14],
              onPressed: () {
                if (currentWorkoutIndex != workouts.length - 1) {
                  AnimatedNavigator().push(
                    context,
                    WorkoutsViewChallenge(
                      workoutsIndex: currentWorkoutIndex + 1,
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomAnimatedOpacity(
            child: CustomButton(
                label: 'Workout',
                horizontalPadding: 30,
                onPressed: () {
                  AnimatedNavigator().pushAndRemoveUntil(
                    context,
                    const HomeMainScreen(),
                  );
                }),
          ),
          const SizedBox(height: 37),
        ],
      ),
    );
  }
}

Widget congratulateData({
  required String title,
  required String value,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        value,
        style: const TextStyle(
          color: black,
          fontSize: 35,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        title,
        style: const TextStyle(
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
