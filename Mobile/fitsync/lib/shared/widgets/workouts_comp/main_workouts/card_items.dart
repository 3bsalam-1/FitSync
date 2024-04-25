import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/workouts/favorite_workouts_cubit.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../../data/models/workouts_model.dart';
import '../../global/animated_navigator.dart';
import 'package:flutter/material.dart';
import '../../../../screens/workouts/workouts_view_challenge.dart';
import '../../../colors/colors.dart';
import '../../global/custom_image.dart';
import 'custom_start_button.dart';

class CardItems extends StatelessWidget {
  final WorkoutsModel workouts;
  final int workoutIndex;
  final String imagePath;

  const CardItems({
    super.key,
    required this.workouts,
    required this.workoutIndex,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: black,
      ),
      width: width - 30,
      height: 200,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: CustomImage(
              height: 200,
              width: width * 0.42,
              fit: BoxFit.cover,
              imageUrl: imagePath,
              errorColor: red,
              iconSize: 55,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.42,
                  child: Text(
                    workouts.category,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: purple5,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.access_time_sharp,
                        color: white,
                        size: 17,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${workouts.planDurationMn} Minutes Workout',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                CustomStartButton(onTap: () {
                  context
                      .read<FavoriteWorkoutsCubit>()
                      .isFavoriteWorkouts(workouts);
                  AnimatedNavigator().push(
                    context,
                    WorkoutsViewChallenge(
                      workoutsIndex: workoutIndex,
                      workouts: context.read<WorkoutsCubit>().dataLevel,
                      imagePath: imagePath,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
