import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/navigation_page_cubit.dart';
import '../../data/cubit/workouts/workouts_cubit.dart';
import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/global/custom_menu_button.dart';
import '../../shared/widgets/workouts_comp/main_workouts/custom_date_item.dart';
import '../../shared/widgets/workouts_comp/main_workouts/skeleton_workouts.dart';
import '../../shared/widgets/workouts_comp/main_workouts/workouts_body.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
            CustomMenuButton(
              labels: const ['Search workouts', 'Saved workouts'],
              onSelected: (pageIndex) {
                context.read<NavigationPageCubit>().changePage(pageIndex + 9);
              },
              child: const Icon(
                Icons.menu_outlined,
                color: purple2,
              ),
            ),
          ],
        ),
        backgroundColor: white,
        body: BlocBuilder<WorkoutsCubit, WorkoutsState>(
          builder: (context, state) {
            final provider = context.read<WorkoutsCubit>();
            if (provider.allworkouts != null && provider.data != null && provider.challenges != null) {
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
      ),
    );
  }
}
