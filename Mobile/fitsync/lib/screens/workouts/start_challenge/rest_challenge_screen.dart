import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../shared/widgets/global/custom_animated_opacity.dart';
import '../../../shared/widgets/global/custom_image.dart';
import '../../../shared/widgets/global/custom_translate_text.dart';
import 'challenge_begin_screen.dart';
import '../../../shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';

class RestChallengeScreen extends StatelessWidget {
  final int nextExercise;
  final int workoutIndex;

  const RestChallengeScreen({
    super.key,
    required this.workoutIndex,
    required this.nextExercise,
  });

  @override
  Widget build(BuildContext context) {
    final workouts = context.read<WorkoutsCubit>().dataLevel[workoutIndex];
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            CustomAnimatedOpacity(
              child: customTranslateText(
                'Take Rest!',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: purple5,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            CustomAnimatedOpacity(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1),
                duration: const Duration(seconds: 20),
                builder: (context, value, _) {
                  int seconds = (value * 20).toInt();
                  if (seconds == 20) {
                    Future.delayed(const Duration(milliseconds: 300), () {
                      AnimatedNavigator().push(
                        context,
                        ChallengeBeginScreen(
                          indexExercise: nextExercise,
                        ),
                      );
                    });
                  }
                  return customTranslateText(
                    '00:${seconds <= 9 ? '0$seconds' : seconds}',
                    style: GoogleFonts.poppins(
                      fontSize: 35,
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ),
            const CustomAnimatedOpacity(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 22),
                child: Divider(
                  color: gray7,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomAnimatedOpacity(
                child: customTranslateText(
                  'Next Movement(${nextExercise + 1}/${workouts.exercisePlan.length})',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: gray7,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomAnimatedOpacity(
                child: customTranslateText(
                  workouts.exercisePlan[nextExercise],
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(),
            CustomAnimatedOpacity(
              child: CustomImage(
                imageUrl: context.read<WorkoutsCubit>().workoutsImages![
                    workouts.exercisePlan[nextExercise].trim()],
                width: 200,
                height: 200,
                fit: BoxFit.fill,
                errorColor: red,
                iconSize: 55,
              ),
            ),
            const Spacer(),
            CustomAnimatedOpacity(
              child: CustomButton(
                label: 'Skip Rest',
                onPressed: () {
                  AnimatedNavigator().push(
                    context,
                    ChallengeBeginScreen(
                      indexExercise: nextExercise,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
