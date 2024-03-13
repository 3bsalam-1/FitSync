import 'package:fitsync/shared/colors/colors.dart';
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
          context.read<WorkoutsCubit>().dataLevel.isEmpty? 
          const SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              color: purple2,
            ),
          )
          : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: context.read<WorkoutsCubit>().dataLevel.length,
            itemBuilder: (context, index) => CardItems(
              workouts: context.read<WorkoutsCubit>().dataLevel[index],
            ),
          ),
          const SizedBox(height: 30),
          const WorkOutsChallengCard(),
          const SizedBox(height: 30),
          const SavedWorkOuts(),
        ],
      ),
    );
  }
}
