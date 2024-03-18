import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../data/models/workouts_model.dart';
import '../../../services/convert_ms.dart';
import '../../workouts/workouts_screen.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import 'start_challenge_screen.dart';

class CongratulationsScreen extends StatelessWidget {
  final WorkoutsModel currentWorkouts;
  final bool isNextWorkout;

  const CongratulationsScreen({
    super.key,
    required this.currentWorkouts,
    required this.isNextWorkout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(onPressed: () {
        AnimatedNavigator().pop(context);
      }),
      backgroundColor: white,
      body: Column(
        children: [
          Image.asset(
            'assets/images/prize.png',
            width: 230,
            height: 280,
            fit: BoxFit.fill,
          ),
          Text(
            'Congratulations!',
            style: GoogleFonts.poppins(
              fontSize: 35,
              color: gold2,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'You have completed the workout',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: black,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              congratulateData(
                title: 'workout',
                value: '${currentWorkouts.exercisePlan.length}',
              ),
              congratulateData(
                title: 'Cal',
                value: currentWorkouts.calBurned,
              ),
              congratulateData(
                title: 'Minutes',
                value: convertToMS(currentWorkouts.planDurationMn),
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
              label: 'Next workout',
              horizontalPadding: 30,
              colors: isNextWorkout ? [cyan, purple, purple] : [gray14, gray14],
              onPressed: () {
                var allWorkouts = context.read<WorkoutsCubit>().data;
                if (isNextWorkout) {
                  for (int i = 0; i < allWorkouts!.length - 1; i++) {
                    if (allWorkouts[i].category == currentWorkouts.category) {
                      AnimatedNavigator().push(
                        context,
                        StartChallengeScreen(
                          workouts: allWorkouts[i + 1],
                        ),
                      );
                      break;
                    }
                  }
                }
              }),
          const SizedBox(height: 20),
          CustomButton(
              label: 'Workout',
              horizontalPadding: 30,
              onPressed: () {
                AnimatedNavigator().pushAndRemoveUntil(
                  context,
                  const WorkoutsScreen(),
                );
              }),
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
