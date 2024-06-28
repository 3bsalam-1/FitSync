import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubits_logic/global/navigation_page_cubit.dart';
import '../../../data/cubit/workouts/favorite_workouts_cubit.dart';
import '../../../shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';

class EmptySavedWorkoutsScreen extends StatelessWidget {
  const EmptySavedWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Image.asset(
          'assets/images/lock.png',
          width: 370,
          height: 328,
          fit: BoxFit.fill,
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Text(
            'Your Saved Workout is empty you can discover latest workout now',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: gray6,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 50),
        CustomButton(
          label: 'Workout',
          onPressed: () {
            context.read<FavoriteWorkoutsCubit>().showAllSavedWorkouts();
            context.read<NavigationPageCubit>().changePage(1);
          },
        ),
        const Spacer(),
      ],
    );
  }
}
