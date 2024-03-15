import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import '../../../shared/widgets/workouts_comp/workouts_challenges/animated_circle_progress.dart';
import '../../../cubits_logic/workouts/counter_time_challenges.dart';
import '../workouts_view_challenge.dart';
import 'congratulations_screen.dart';
import 'start_challenge_screen.dart';

class ChallengeBeginScreen extends StatelessWidget {
  final int indexExercise;

  const ChallengeBeginScreen({
    super.key,
    required this.indexExercise,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: BlocBuilder<CounterTimeChallenges, int>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                // todo show the image workout
                'assets/images/start_challenge.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              Text(
                context.read<CounterTimeChallenges>().currentExercise,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(flex: 1),
              AnimatedCircleProgress(seconds: state),
              const Spacer(flex: 2),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    label: 'Previous',
                    colors: state != 0? [gray14, gray14]: [cyan, purple, purple],
                    onPressed: () {
                      if (indexExercise != 0) {
                        int time = context.read<CounterTimeChallenges>().exerciseTimeSec[indexExercise-1];
                        context.read<CounterTimeChallenges>().changeExercises(
                          indexExercise - 1,
                          time,
                        );
                      } else {
                        AnimatedNavigator().pushAndRemoveUntilRoute(
                          context,
                          WorkoutsViewChallenge(
                            workouts: context.read<CounterTimeChallenges>().currentWorkouts,
                          ),
                          StartChallengeScreen.routeName,
                        );
                      }
                    },
                    horizontalPadding: 15,
                    width: width * 0.38,
                  ),
                  CustomButton(
                    label: 'Skip',
                    onPressed: () {
                      if (state == 0) {
                        int length = context
                            .read<CounterTimeChallenges>()
                            .currentWorkouts
                            .exercisePlan
                            .length;
                        if (indexExercise < length - 1) {
                          int time = context.read<CounterTimeChallenges>().exerciseTimeSec[indexExercise+1];
                          context.read<CounterTimeChallenges>().changeExercises(
                                indexExercise + 1,
                                time,
                              );
                        } else {
                          AnimatedNavigator().push(
                            context,
                            const CongratulationsScreen(),
                          );
                        }
                      }
                    },
                    horizontalPadding: 15,
                    width: width * 0.38,
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
