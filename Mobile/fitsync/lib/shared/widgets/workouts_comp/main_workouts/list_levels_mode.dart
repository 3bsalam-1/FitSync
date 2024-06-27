import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cubits_logic/workouts/selected_level_mode.dart';
import '../../../../data/cubit/workouts/workouts_cubit.dart';
import '../../../colors/colors.dart';
import '../../global/custom_translate_text.dart';

class ListLevelsMode extends StatelessWidget {
  const ListLevelsMode({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        itemCount: context.read<SelectedLevelMode>().level.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => BlocBuilder<SelectedLevelMode, int>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                context.read<SelectedLevelMode>().selectedLevel(index);
                context.read<WorkoutsCubit>().selectWorkoutsByLevel(
                      context.read<SelectedLevelMode>().level[index],
                    );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                padding: const EdgeInsets.symmetric(horizontal: 7),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: state == index ? purple5 : white,
                  border: Border.all(
                    width: 1.2,
                    color: state == index ? purple5 : gray4,
                  ),
                ),
                child: Center(
                  child: customTranslateText(
                    context.read<SelectedLevelMode>().level[index],
                    style: GoogleFonts.poppins(
                      fontSize: 11.6,
                      color: state == index ? white : gray4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
