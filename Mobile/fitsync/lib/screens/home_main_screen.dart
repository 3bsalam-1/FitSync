import 'package:fitsync/data/cubit/user_data/user_data_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cubits_logic/navigation_page_cubit.dart';
import '../cubits_logic/new_token_cubit.dart';
import '../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../data/cubit/workouts/favorite_workouts_cubit.dart';
import '../data/cubit/workouts/workouts_cubit.dart';
import '../shared/colors/colors.dart';
import '../shared/widgets/item_bottom_app_bar.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NewTokenCubit, bool>(
          listener: (context, state) {
            if (state) {
              context.read<UserDataInfoCubit>().getUserDataInfo(context);
            }
          },
        ),
        BlocListener<SmartWatchCubit, SmartWatchState>(
          listener: (context, state) {
            if (state is SmartWatchConnection) {
              context.read<SmartWatchCubit>().getSmartWatchData();
            }
          },
        ),
        BlocListener<UserDataInfoCubit, UserDataInfoState>(
          listener: (context, state) {
            if (state is UserDataSuccess) {
              context.read<WorkoutsCubit>().getWorkoutsData(
                    context.read<UserDataInfoCubit>().userData!,
                  );
              context.read<WorkoutsCubit>().getWorkoutsChallenges(
                    context.read<UserDataInfoCubit>().userData!,
                  );
              context.read<WorkoutsCubit>().getAllWorkouts();
              context.read<FavoriteWorkoutsCubit>().getAllFavoriteWorkouts();
            }
          },
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<NavigationPageCubit, Widget>(
          builder: (context, page) {
            return page;
          },
        ),
        backgroundColor: white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 78,
            width: 78,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: purple5,
              elevation: 0,
              onPressed: () {
                context.read<NavigationPageCubit>().changePage(0);
              },
              child: const Icon(
                Icons.home_rounded,
                color: white,
                size: 33,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: gray4.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 3,
              ),
            ],
          ),
          height: 70,
          child: BottomAppBar(
            notchMargin: 0,
            shape: const CircularNotchedRectangle(),
            surfaceTintColor: white,
            color: white,
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemBottomAppBar(
                  onTap: () {
                    context.read<NavigationPageCubit>().changePage(1);
                  },
                  indexPage: 1,
                  icon: FontAwesomeIcons.dumbbell,
                  label: 'Workout',
                  paddingLeft: 4,
                ),
                ItemBottomAppBar(
                  label: 'Diet',
                  icon: FontAwesomeIcons.bowlFood,
                  indexPage: 2,
                  onTap: () {
                    context.read<NavigationPageCubit>().changePage(2);
                  },
                ),
                const SizedBox(width: 30),
                ItemBottomAppBar(
                  label: 'Activity',
                  icon: Icons.timeline_outlined,
                  indexPage: 3,
                  onTap: () {
                    context.read<NavigationPageCubit>().changePage(3);
                  },
                ),
                ItemBottomAppBar(
                  label: 'Profile',
                  icon: FontAwesomeIcons.user,
                  indexPage: 4,
                  onTap: () {
                    context.read<NavigationPageCubit>().changePage(4);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
