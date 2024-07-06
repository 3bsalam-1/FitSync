import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/models/workouts_model.dart';
import '../../../../services/convert_ms.dart';
import '../../../colors/colors.dart';

class WorkoutsChallengesTime extends StatelessWidget {
  final WorkoutsModel workouts;
  const WorkoutsChallengesTime({super.key, required this.workouts});

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
                convertToMS(workouts.planDurationMn),
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
                '${workouts.exercisePlan.length} Exercises',
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
