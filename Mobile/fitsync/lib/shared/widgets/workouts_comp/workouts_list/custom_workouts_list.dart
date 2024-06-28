import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/workouts/filters_workouts_cubit.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../../data/models/workouts_model.dart';
import '../../../../screens/workouts/workouts_list_search_screen.dart';
import '../../../../screens/workouts/workouts_view_challenge.dart';
import '../../global/animated_navigator.dart';
import '../../global/custom_image.dart';

class CustomWorkoutsList extends StatelessWidget {
  const CustomWorkoutsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersWorkoutsCubit, List<WorkoutsModel>>(
      builder: (context, state) {
        var provider = context.read<FiltersWorkoutsCubit>();
        final workoutsProvider = context.read<WorkoutsCubit>();
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            boxShadow: [
              BoxShadow(
                color: gray4.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(
              thickness: 1.2,
              color: gray4,
            ),
            itemCount: state.length,
            itemBuilder: (context, index) => Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 12),
                CustomImage(
                  imageUrl: workoutsProvider.workoutsImages?["${index % 10}"],
                  width: 60,
                  height: 50,
                  fit: BoxFit.fill,
                  iconSize: 30,
                  errorColor: red,
                ),
                const SizedBox(width: 12),
                Text(
                  provider.namesResults.isNotEmpty
                      ? provider.namesResults[index]
                      : state[index].category,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: gray4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    AnimatedNavigator().push(
                      context,
                      WorkoutsViewChallenge(
                        popScreen: const WorkoutsListSearchScreen(),
                        workoutsIndex: 0,
                        workouts: state,
                        imagePath:
                            workoutsProvider.workoutsImages?["${index % 10}"],
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: purple2,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
