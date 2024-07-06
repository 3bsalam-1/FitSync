import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubits_logic/workouts/counter_time_challenges.dart';
import '../../../shared/widgets/global/custom_animated_opacity.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import 'package:flutter/material.dart';
import 'challenge_begin_screen.dart';

class StartChallengeScreen extends StatefulWidget {
  final int workoutsIndex;

  const StartChallengeScreen({super.key, required this.workoutsIndex});

  @override
  State<StartChallengeScreen> createState() => _StartChallengeScreenState();
}

class _StartChallengeScreenState extends State<StartChallengeScreen> {
  int counter = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter == 20) {
        _timer.cancel();
        context.read<CounterTimeChallenges>().currentWorkoutIndex =
            widget.workoutsIndex;
        AnimatedNavigator().push(
          context,
          const ChallengeBeginScreen(
            indexExercise: 0,
          ),
        );
      } else {
        setState(() {
          ++counter;
        });
      }
    });
  }

  void _cancelTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: Column(
        children: [
          const Spacer(flex: 2),
          CustomAnimatedOpacity(
            child: Text(
              'Get Ready!',
              style: GoogleFonts.poppins(
                fontSize: 40,
                color: purple5,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const Spacer(flex: 1),
          CustomAnimatedOpacity(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 170,
                  width: 170,
                  child: CircularProgressIndicator(
                    value: (counter / 20).toDouble(),
                    backgroundColor: gray3.withOpacity(0.1),
                    color: purple5,
                    strokeWidth: 16.0,
                  ),
                ),
                Text(
                  '$counter',
                  style: GoogleFonts.poppins(
                    fontSize: 50,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          const Spacer(flex: 2),
          CustomAnimatedOpacity(
            child: CustomButton(
              label: 'Start over',
              onPressed: () {
                setState(() {
                  counter = 0;
                });
                _startTimer();
              },
              horizontalPadding: 100,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
