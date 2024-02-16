import 'package:flutter/material.dart';
import '../../../colors/colors.dart';

class SleepInformation extends StatelessWidget {
  final String value;
  final String title;

  const SleepInformation({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 6,
              backgroundColor: purple5,
            ),
            const SizedBox(width: 3),
            Text(
              title,
              style: const TextStyle(
                color: gray10,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
