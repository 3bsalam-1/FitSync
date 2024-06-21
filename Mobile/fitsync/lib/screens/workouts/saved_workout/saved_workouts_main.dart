import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/global/navigation_page_cubit.dart';
import '../../../data/cubit/workouts/favorite_workouts_cubit.dart';
import '../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/custom_animated_opacity.dart';
import '../../../shared/widgets/global/custom_app_bar.dart';
import 'empty_saved_workouts_screen.dart';
import 'saved_workouts_screen.dart';

class SavedWorkoutsMain extends StatelessWidget {
  const SavedWorkoutsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.read<FavoriteWorkoutsCubit>().showAllSavedWorkouts();
        context.read<NavigationPageCubit>().changePage(1);
      },
      child: Scaffold(
        appBar: customAppBar(
          context,
          'Saved Workout',
          () {
            context.read<FavoriteWorkoutsCubit>().showAllSavedWorkouts();
            context.read<NavigationPageCubit>().changePage(1);
          },
        ),
        backgroundColor: white,
        body: BlocBuilder<WorkoutsCubit, WorkoutsState>(
          builder: (context, state) {
            final provider = context.read<FavoriteWorkoutsCubit>();
            if (provider.favoriteWorkouts != null) {
              return provider.favoriteWorkouts!.isNotEmpty
                  ? CustomAnimatedOpacity(
                      child: SavedWorkOutsScreen(
                        workoutsFav: provider.favoriteWorkouts!,
                      ),
                    )
                  : const CustomAnimatedOpacity(
                      child: EmptySavedWorkoutsScreen(),
                    );
            } else {
              return const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: purple5,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
