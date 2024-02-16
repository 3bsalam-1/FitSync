import 'package:flutter/material.dart';
import '../../../colors/colors.dart';

class SleepHours extends StatelessWidget {
  final String current;
  final String basic;
  final String title;

  const SleepHours({
    super.key,
    required this.title,
    required this.basic,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              current,
              style: const TextStyle(
                fontSize: 40,
                color: purple5,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              basic,
              style: const TextStyle(
                fontSize: 14,
                color: gray6,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
