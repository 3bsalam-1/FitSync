import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cubits_logic/global/navigation_page_cubit.dart';
import '../../../../data/cubit/workouts/favorite_workouts_cubit.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../colors/colors.dart';
import 'card_items.dart';
import 'list_levels_mode.dart';
import 'saved_workouts.dart';
import 'workouts_challenge_card.dart';

class WorkOustBody extends StatelessWidget {
  const WorkOustBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        const ListLevelsMode(),
        const SizedBox(height: 22),
        BlocBuilder<WorkoutsCubit, WorkoutsState>(builder: (context, state) {
          final dataLevel = context.read<WorkoutsCubit>().dataLevel;
          return SizedBox(
            height: 200,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dataLevel.length > 10 ? 10 : dataLevel.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) => CardItems(
                workoutIndex: index,
                imagePath: context
                    .read<WorkoutsCubit>()
                    .workoutsImages!['${index % 10}'],
                workouts: context.read<WorkoutsCubit>().dataLevel[index],
              ),
            ),
          );
        }),
        const SizedBox(height: 30),
        const WorkOutsChallengCard(),
        const SizedBox(height: 30),
        BlocBuilder<WorkoutsCubit, WorkoutsState>(
          builder: (context, state) {
            final provider = context.read<FavoriteWorkoutsCubit>();
            return provider.favoriteWorkouts!.isNotEmpty
                ? state is FavoriteWorkoutsLoading
                    ? const CircularProgressIndicator(
                        color: purple,
                      )
                    : const SavedWorkOuts()
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Saved Workouts',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              provider.showAllSavedWorkouts();
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                context
                                    .read<NavigationPageCubit>()
                                    .changePage(9);
                              });
                            },
                            child: Text(
                              'View all',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: provider.viewAllFavorites
                                    ? purple2
                                    : gray14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Text(
                        "There is NO saved workouts",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: gray14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  );
          },
        ),
      ],
    );
  }
}
