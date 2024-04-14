import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits_logic/workouts/selected_level_mode.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import 'card_items.dart';
import 'list_levels_mode.dart';
import 'saved_workouts.dart';
import 'workouts_challenge_card.dart';

class WorkOustBody extends StatelessWidget {
  const WorkOustBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedLevelMode(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          const ListLevelsMode(),
          const SizedBox(height: 22),
          BlocBuilder<WorkoutsCubit, WorkoutsState>(builder: (context, state) {
            return SizedBox(
              height: 200,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: context.read<WorkoutsCubit>().dataLevel.length,
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) => CardItems(
                  workoutIndex: index,
                  imagePath: context.read<WorkoutsCubit>().workoutsImages!['${index%10}'],
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
              final provider = context.read<WorkoutsCubit>();
              return provider.favoriteWorkouts!.isNotEmpty
                  ? const SavedWorkOuts()
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
