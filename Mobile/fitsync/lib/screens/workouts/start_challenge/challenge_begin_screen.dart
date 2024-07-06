import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/custom_animated_opacity.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/global/custom_image.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../../shared/widgets/workouts_comp/workouts_challenges/animated_circle_progress.dart';
import '../../../cubits_logic/workouts/counter_time_challenges.dart';
import '../workouts_screen.dart';
import '../workouts_view_challenge.dart';
import 'congratulations_screen.dart';
import 'rest_challenge_screen.dart';

class ChallengeBeginScreen extends StatelessWidget {
  final int indexExercise;

  const ChallengeBeginScreen({
    super.key,
    required this.indexExercise,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final workoutsImages = context.read<WorkoutsCubit>().workoutsImages;
    final providerTime = context.read<CounterTimeChallenges>();
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pushAndRemoveUntil(
            context,
            WorkoutsViewChallenge(
              workouts: providerTime.allWorkouts,
              workoutsIndex: providerTime.currentWorkoutIndex,
              imagePath: workoutsImages![
                  '${context.read<CounterTimeChallenges>().currentWorkoutIndex}'],
            ),
          );
        },
      ),
      backgroundColor: white,
      body: BlocBuilder<CounterTimeChallenges, int>(
        builder: (context, state) {
          var provider = context.read<CounterTimeChallenges>();
          var workouts = provider.allWorkouts[provider.currentWorkoutIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAnimatedOpacity(
                child: CustomImage(
                  imageUrl: workoutsImages![
                      workouts.exercisePlan[indexExercise].trim()],
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  errorColor: red,
                  iconSize: 55,
                ),
              ),
              CustomAnimatedOpacity(
                child: Text(
                  workouts.exercisePlan[indexExercise],
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(flex: 1),
              CustomAnimatedOpacity(
                child: AnimatedCircleProgress(
                  seconds: provider.exerciseTimeSec[indexExercise],
                  current: indexExercise,
                ),
              ),
              const Spacer(flex: 2),
              CustomAnimatedOpacity(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: 'Previous',
                      colors: !provider.isPrevouis[indexExercise]
                          ? [gray14, gray14]
                          : [cyan, purple, purple],
                      onPressed: () {
                        if (provider.isPrevouis[indexExercise]) {
                          if (indexExercise != 0) {
                            context.read<CounterTimeChallenges>().setCounter(
                                  provider.exerciseTimeSec[indexExercise - 1],
                                );
                            AnimatedNavigator().pop(context);
                          } else {
                            AnimatedNavigator().pushAndRemoveUntil(
                              context,
                              WorkoutsViewChallenge(
                                workoutsIndex: provider.currentWorkoutIndex,
                                workouts: provider.allWorkouts,
                                imagePath: workoutsImages[
                                    '${provider.currentWorkoutIndex}'],
                              ),
                            );
                          }
                        }
                      },
                      horizontalPadding: 15,
                      width: width * 0.38,
                    ),
                    CustomButton(
                      label: 'Skip',
                      onPressed: () {
                        if (indexExercise <
                            provider.exerciseTimeSec.length - 1) {
                          context.read<CounterTimeChallenges>().setCounter(
                                provider.exerciseTimeSec[indexExercise + 1],
                              );
                          AnimatedNavigator().push(
                            context,
                            RestChallengeScreen(
                              workoutIndex: provider.currentWorkoutIndex,
                              nextExercise: indexExercise + 1,
                            ),
                          );
                        } else {
                          provider.getExerciseResult(workouts);
                          provider.saveWorkoutsActiveHours();
                          changeActivity = true;
                          AnimatedNavigator().push(
                            context,
                            CongratulationsScreen(
                              currentWorkoutIndex: provider.currentWorkoutIndex,
                            ),
                          );
                        }
                      },
                      horizontalPadding: 15,
                      width: width * 0.38,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
