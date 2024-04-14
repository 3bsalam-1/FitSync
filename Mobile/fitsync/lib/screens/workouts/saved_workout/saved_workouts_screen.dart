import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/models/workouts_model.dart';
import '../../../shared/colors/colors.dart';

class SavedWorkOutsScreen extends StatelessWidget {
  final List<WorkoutsModel> workoutsFav;

  const SavedWorkOutsScreen({super.key, required this.workoutsFav});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: workoutsFav.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 25),
            itemBuilder: (context, index) {
              final workouts = workoutsFav[index];
              return Container(
                padding: const EdgeInsets.only(
                  left: 22,
                  top: 12,
                  bottom: 12,
                  right: 12,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: gray9,
                  ),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: gray9.withOpacity(0.2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workouts.category,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${workouts.exercisePlan.length} Exercises',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: gray4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${workouts.planDurationMn} Minutes',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: gray4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/pullup.png',
                      width: 130,
                      height: 108,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
