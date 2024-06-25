import 'dart:async';
import '../../../../cubits_logic/workouts/counter_time_challenges.dart';
import '../../../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../services/convert_ms.dart';

class AnimatedCircleProgress extends StatefulWidget {
  final int seconds;
  final int current;

  const AnimatedCircleProgress({
    super.key,
    required this.seconds,
    required this.current,
  });

  @override
  State<AnimatedCircleProgress> createState() => _AnimatedCircleProgressState();
}

class _AnimatedCircleProgressState extends State<AnimatedCircleProgress> {
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
      if (counter == widget.seconds) {
        _timer.cancel();
        context.read<CounterTimeChallenges>().countDownFinish(widget.current);
      }
      if (context.read<CounterTimeChallenges>().isPrevouis[widget.current]) {
        // the user finished the workouts
        counter = widget.seconds;
      } else {
        // the user still doing exercise
        ++counter;
      }
      setState(() {});
    });
  }

  void _cancelTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 170,
          width: 170,
          child: CircularProgressIndicator(
            value: counter / widget.seconds,
            backgroundColor: gray3.withOpacity(0.1),
            color: purple5,
            strokeWidth: 16.0,
          ),
        ),
        Text(
          convertSecondsToMS(counter),
          style: GoogleFonts.poppins(
            fontSize: 50,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
