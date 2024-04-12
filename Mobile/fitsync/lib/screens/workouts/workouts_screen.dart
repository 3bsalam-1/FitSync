import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/cubit/workouts/workouts_cubit.dart';
import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/workouts_comp/main_workouts/custom_date_item.dart';
import '../../shared/widgets/workouts_comp/main_workouts/skeleton_workouts.dart';
import '../../shared/widgets/workouts_comp/main_workouts/workouts_body.dart';
import 'workouts_list_search_screen.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
        title: Text(
          'Workouts',
          style: GoogleFonts.poppins(
            fontSize: 22,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AnimatedNavigator().push(
                context,
                const WorkoutsListSearchScreen(),
              );
            },
            icon: const Icon(
              Icons.menu_outlined,
              color: purple2,
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: BlocBuilder<WorkoutsCubit, WorkoutsState>(
        builder: (context, state) {
          if (state is WorkoutsLoaded ||
              state is WorkoutsGetFavorite ||
              state is WorkoutsAddFavorite) {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    CustomDayItem(),
                    WorkOustBody(),
                  ],
                ),
              ),
            );
          }
          return const SkeletonWorkouts();
        },
      ),
    );
  }
}
