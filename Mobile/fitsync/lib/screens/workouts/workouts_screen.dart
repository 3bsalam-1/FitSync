import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/internet_connectivity_cubit.dart';
import '../../data/cubit/workouts/favorite_workouts_cubit.dart';
import '../../data/cubit/workouts/workouts_cubit.dart';
import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/error_internet_connection.dart';
import '../../shared/widgets/workouts_comp/main_workouts/custom_date_item.dart';
import '../../shared/widgets/workouts_comp/main_workouts/skeleton_workouts.dart';
import '../../shared/widgets/workouts_comp/main_workouts/workouts_body.dart';
import 'workouts_list_search_screen.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: white,
          leading: null,
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
                Icons.format_align_left_sharp,
                color: purple2,
              ),
            ),
          ],
        ),
        backgroundColor: white,
        body: BlocBuilder<InternetConnectivityCubit, InternetConnectivityState>(
          builder: (context, state) {
            if (state is InternetConnectivityOFF) {
              return const ErrorInternetConnection();
            }
            return BlocConsumer<WorkoutsCubit, WorkoutsState>(
              listener: (context, state) {
                if (state is WorkoutsLoaded) {
                  context.read<FavoriteWorkoutsCubit>().setFavoriteToInitial();
                  context.read<InternetConnectivityCubit>().checkIfHasData(
                        context.read<WorkoutsCubit>().allworkouts,
                      );
                }
              },
              builder: (context, state) {
                final provider = context.read<WorkoutsCubit>();
                if (provider.allworkouts != null &&
                    provider.data != null &&
                    provider.challenges != null) {
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
            );
          },
        ),
      ),
    );
  }
}
