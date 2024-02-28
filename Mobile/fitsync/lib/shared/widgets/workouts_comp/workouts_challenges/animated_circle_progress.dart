import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class AnimatedCircleProgress extends StatelessWidget {
  final int seconds;
  const AnimatedCircleProgress({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1),
      duration: Duration(seconds: seconds),
      builder: (context, value, _) => Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 170,
            width: 170,
            child: CircularProgressIndicator(
              value: value,
              backgroundColor: gray3.withOpacity(0.1),
              color: purple5,
              strokeWidth: 16.0,
            ),
          ),
          Text(
            (value*seconds).toInt().toString(),//.toInt().toString(),
            style: const TextStyle(
              color: black,
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
