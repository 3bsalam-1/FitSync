import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../colors/colors.dart';

class SavedWorkOuts extends StatelessWidget {
  const SavedWorkOuts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
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
                    provider.showAllSavedWorkouts();
                  },
                  child: Text(
                    'View all',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: provider.viewAllFavorites ? purple2 : gray14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 180,
              child: ListView.separated(
                itemCount: provider.viewAllFavorites
                    ? provider.favoriteWorkouts!.length
                    : 1,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 30),
                itemBuilder: (context, index) {
                  return Container(
                    width: provider.viewAllFavorites
                        ? 250
                        : MediaQuery.of(context).size.width - 30,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: black,
                      image: const DecorationImage(
                        opacity: 0.38,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/pullup.png',
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  provider.favoriteWorkouts![index].category,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: provider.viewAllFavorites ? 130 : 210,
                                child: Text(
                                  'Finish this exercise in ${provider.favoriteWorkouts![index].planDurationMn} minutes',
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
                          padding: EdgeInsets.only(top: 10, right: 10),
                          child: Icon(
                            Icons.favorite,
                            color: white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
