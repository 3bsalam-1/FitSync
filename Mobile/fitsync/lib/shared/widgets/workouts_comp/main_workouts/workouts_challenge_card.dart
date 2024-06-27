import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../../screens/workouts/workouts_view_challenge.dart';
import '../../../colors/colors.dart';
import '../../global/animated_navigator.dart';
import '../../global/custom_image.dart';
import 'custom_start_button.dart';
import '../../global/custom_translate_text.dart';

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
              customTranslateText(
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
                child: customTranslateText(
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
              itemCount:
                  provider.viewAllChallenge ? provider.challenges!.length : 1,
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
                      child: CustomImage(
                        imageUrl: provider.workoutsImages!['${index % 10}'],
                        height: 205,
                        width: provider.viewAllChallenge ? 135 : width * 0.42,
                        fit: BoxFit.cover,
                        errorColor: red,
                        iconSize: 55,
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
                          child: customTranslateText(
                            '7 x ${provider.viewAllChallenge ? index + 1 : DateTime.now().weekday} CHALLENGE',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: customTranslateText(
                            provider.viewAllChallenge
                                ? provider.challenges![index].category
                                : provider
                                    .challenges![DateTime.now().weekday - 1]
                                    .category,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomStartButton(
                          onTap: () {
                            AnimatedNavigator().push(
                              context,
                              WorkoutsViewChallenge(
                                workouts: provider.challenges!,
                                imagePath:
                                    provider.workoutsImages!['${index % 10}'],
                                workoutsIndex: provider.viewAllChallenge
                                    ? index
                                    : DateTime.now().weekday - 1,
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
