import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../../screens/workouts/workouts_view_challenge.dart';
import '../../../colors/colors.dart';
import '../../global/animated_navigator.dart';
import 'custom_start_button.dart';

class WorkOutsChallengCard extends StatelessWidget {
  const WorkOutsChallengCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(builder: (context, state) {
      final provider = context.read<WorkoutsCubit>();
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Challenges',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  provider.showAllChallenges();
                },
                child: Text(
                  'View all',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: provider.viewAllChallenge ? purple2 : gray14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 205,
            child: ListView.separated(
              itemCount: provider.viewAllChallenge ? provider.challenges!.length : 1,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 30),
              itemBuilder: (_, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: black,
                ),
                width: provider.viewAllChallenge ? width - 80 : width - 30,
                height: 205,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/workouts.png',
                        height: 200,
                        width: provider.viewAllChallenge ? 135 : width * 0.42,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            '7 x ${provider.viewAllChallenge ? index + 1 : DateTime.now().weekday} CHALLENGE',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          provider.viewAllChallenge
                              ? provider.challenges![index].category
                              : provider.challenges![DateTime.now().weekday-1].category,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomStartButton(
                          onTap: () {
                            AnimatedNavigator().push(
                              context,
                              WorkoutsViewChallenge(
                                workouts: provider.challenges!,
                                workoutsIndex: provider.viewAllChallenge
                                    ? index
                                    : DateTime.now().weekday-1,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
