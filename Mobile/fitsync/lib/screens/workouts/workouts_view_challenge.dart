import '../../data/cubit/user_data/user_data_info_cubit.dart';
import '../home_main_screen.dart';
import 'start_challenge/start_challenge_screen.dart';
import '../../../shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/cubit/workouts/workouts_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/workouts_comp/workouts_challenges/workouts_challenges_time.dart';
import '../../shared/widgets/workouts_comp/workouts_challenges/workouts_list_challenges.dart';

class WorkoutsViewChallenge extends StatelessWidget {
  final int workoutsIndex;
  const WorkoutsViewChallenge({super.key, required this.workoutsIndex});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final workouts = context.read<WorkoutsCubit>().dataLevel[workoutsIndex];
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: width,
              height: height * 0.4,
              decoration: const BoxDecoration(
                color: black,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  opacity: 0.6,
                  // todo change image here
                  image: AssetImage('assets/images/fullBody.png'),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 15,
              child: IconButton(
                onPressed: () {
                  AnimatedNavigator().pushAndRemoveUntil(
                    context,
                    const HomeMainScreen(),
                  );
                },
                icon: Container(
                  width: 37,
                  height: 37,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: purple2,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.65,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          workouts.category,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        BlocBuilder<WorkoutsCubit, WorkoutsState>(
                          builder: (context, state) {
                            final provider = context.read<WorkoutsCubit>();
                            return IconButton(
                              onPressed: () {
                                context.read<WorkoutsCubit>().addWorkoutsToFavorites(
                                  userId: context.read<UserDataInfoCubit>().userData!.userId,
                                  workouts: workouts,
                                );                             
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: provider.isFavorite? purple5: gray14,
                                size: 25,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    WorkoutsChallengesTime(workouts: workouts),
                    const SizedBox(height: 9),
                    WorkoutsListChallenges(workouts: workouts),
                    const Spacer(),
                    CustomButton(
                      label: 'Start',
                      horizontalPadding: width * 0.14,
                      onPressed: () {
                        AnimatedNavigator().push(
                          context,
                          StartChallengeScreen(
                            workoutsIndex: workoutsIndex,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
