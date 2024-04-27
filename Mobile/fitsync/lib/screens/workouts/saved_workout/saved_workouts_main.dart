import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubits_logic/global/navigation_page_cubit.dart';
import '../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../../data/cubit/workouts/favorite_workouts_cubit.dart';
import '../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../services/pref.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/skeleton_container_loading.dart';
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
        appBar: AppBar(
          backgroundColor: white,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: const Text('Saved Workout'),
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 22,
            color: black,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.read<FavoriteWorkoutsCubit>().showAllSavedWorkouts();
              context.read<NavigationPageCubit>().changePage(1);
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              color: purple3,
              size: 40,
            ),
          ),
          actions: [
            BlocBuilder<UserDataInfoCubit, UserDataInfoState>(
                builder: (context, state) {
              if (state is UserDataSuccess) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                    right: 12,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.network(
                      Prefs.getStringList('user')![3],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }
              return const Padding(
                padding: EdgeInsets.only(
                  top: 7,
                  right: 12,
                ),
                child: SkeletonContainerLoading(
                  height: 45,
                  width: 45,
                  borderRaduis: 99,
                ),
              );
            }),
          ],
        ),
        backgroundColor: white,
        body: BlocBuilder<WorkoutsCubit, WorkoutsState>(
          builder: (context, state) {
            final provider = context.read<FavoriteWorkoutsCubit>();
            if (provider.favoriteWorkouts != null) {
              return provider.favoriteWorkouts!.isNotEmpty
                  ? SavedWorkOutsScreen(workoutsFav: provider.favoriteWorkouts!)
                  : const EmptySavedWorkoutsScreen();
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
