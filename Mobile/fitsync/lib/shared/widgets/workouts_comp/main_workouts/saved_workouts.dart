import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cubits_logic/global/navigation_page_cubit.dart';
import '../../../../data/cubit/workouts/favorite_workouts_cubit.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../colors/colors.dart';
import '../../global/custom_image.dart';

class SavedWorkOuts extends StatelessWidget {
  const SavedWorkOuts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteWorkoutsCubit, FavoriteWorkoutsState>(
      builder: (context, state) {
        final providerFav = context.read<FavoriteWorkoutsCubit>();
        final provider = context.read<WorkoutsCubit>();
        return Column(
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
                    providerFav.showAllSavedWorkouts();
                    Future.delayed(const Duration(milliseconds: 500), () {
                      context.read<NavigationPageCubit>().changePage(9);
                    });
                  },
                  child: Text(
                    'View all',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: providerFav.viewAllFavorites ? purple2 : gray14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            BlocBuilder<FavoriteWorkoutsCubit, FavoriteWorkoutsState>(
              builder: (context, state) {
                if (state is FavoriteWorkoutsLoading) {
                  return const CircularProgressIndicator(
                    color: purple,
                  );
                }
                if (state is FavoriteWorkoutsEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 50),
                    child: Text(
                      "There is NO saved workouts",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: gray14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 180,
                    child: ListView.separated(
                      itemCount: providerFav.favoriteWorkouts!.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 30),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 250,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: black,
                          ),
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CustomImage(
                                    imageUrl: provider
                                        .workoutsImages!['${index % 10}'],
                                    width: 250,
                                    height: 180,
                                    fit: BoxFit.cover,
                                    iconSize: 60,
                                    errorColor: red,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: Text(
                                            providerFav.favoriteWorkouts![index]
                                                .category,
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          width: 130,
                                          child: Text(
                                            'Finish this exercise in ${providerFav.favoriteWorkouts![index].planDurationMn} minutes',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 10, right: 10),
                                    child: Icon(
                                      Icons.favorite,
                                      color: white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
