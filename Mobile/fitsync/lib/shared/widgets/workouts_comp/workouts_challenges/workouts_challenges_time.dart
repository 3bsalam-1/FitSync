import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';

class WorkoutsChallengesTime extends StatelessWidget {
  const WorkoutsChallengesTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: gray12.withOpacity(0.5),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                size: 18,
                color: purple5,
              ),
              const SizedBox(width: 5),
              Text(
                '60:00',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: purple5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: gray12.withOpacity(0.5),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.directions_run_rounded,
                size: 18,
                color: purple5,
              ),
              const SizedBox(width: 5),
              Text(
                '20 Exercises',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: purple5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
