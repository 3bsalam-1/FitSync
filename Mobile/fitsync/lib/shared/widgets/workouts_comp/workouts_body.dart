import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/workouts/selected_level_mode.dart';
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
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12),
          ListLevelsMode(),
          SizedBox(height: 22),
          CardItems(),
          SizedBox(height: 30),
          WorkOutsChallengCard(),
          SizedBox(height: 30),
          SavedWorkOuts(),
        ],
      ),
    );
  }
}
