import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/skeleton_container_loading.dart';
import 'empty_saved_workouts_screen.dart';

class SavedWorkOutsScreen extends StatelessWidget {
  const SavedWorkOutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            AnimatedNavigator().pop(context);
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
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }
            return const SkeletonContainerLoading(
              height: 50,
              width: 50,
              borderRaduis: 99,
            );
          }),
        ],
      ),
      backgroundColor: white,
      body:
          BlocBuilder<WorkoutsCubit, WorkoutsState>(builder: (context, state) {
        final provider = context.read<WorkoutsCubit>();
        if (state is WorkoutsGetFavorite) {
          return provider.favoriteWorkouts.isNotEmpty
              ? Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        itemCount: provider.favoriteWorkouts.length,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 25),
                        itemBuilder: (context, index) {
                          final workouts = provider.favoriteWorkouts[index];
                          return Container(
                            padding: const EdgeInsets.only(
                              left: 22,
                              top: 12,
                              bottom: 12,
                              right: 12,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: gray9,
                              ),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: gray9.withOpacity(0.2),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      workouts.category,
                                      style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '${workouts.exercisePlan.length} Exercises',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: gray4,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '${workouts.planDurationMn} Minutes',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: gray4,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/pullup.png',
                                  width: 130,
                                  height: 108,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                )
              : const EmptySavedWorkoutsScreen();
        }
        return CircleAvatar();
      }),
    );
  }
}
