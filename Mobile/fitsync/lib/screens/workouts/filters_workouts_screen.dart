import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/cubit/workouts/filters_workouts_cubit.dart';
import '../../data/cubit/workouts/workouts_cubit.dart';
import '../../data/models/workouts_model.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../../shared/widgets/global/custom_translate_text.dart';
import '../../shared/widgets/workouts_comp/workouts_list/custom_filter_item.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';

class FiltersWorkoutsScreen extends StatelessWidget {
  const FiltersWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: purple2,
            size: 37,
          ),
        ),
        centerTitle: true,
        title: CustomAnimatedOpacity(
          child: customTranslateText(
            'Filter',
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      backgroundColor: white,
      body: CustomAnimatedOpacity(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: gray4,
            ),
            child: BlocBuilder<FiltersWorkoutsCubit, List<WorkoutsModel>>(
              builder: (context, state) {
                final provider = context.read<FiltersWorkoutsCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    customTranslateText('Category'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        CustomFilterItem(
                          label: 'Cardio',
                          onTap: () {
                            provider.filterSelectedCat("Cardio");
                          },
                          selectedLabel: provider.selectedCat,
                        ),
                        CustomFilterItem(
                          label: 'Flexibility',
                          onTap: () {
                            provider.filterSelectedCat("Flexibility");
                          },
                          selectedLabel: provider.selectedCat,
                        ),
                        CustomFilterItem(
                          label: 'Strength',
                          onTap: () {
                            provider.filterSelectedCat("Strength");
                          },
                          selectedLabel: provider.selectedCat,
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    customTranslateText('Target Muscle'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        CustomFilterItem(
                          label: 'Quadriceps',
                          onTap: () {
                            provider.filterSelectedMus("Quadriceps");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                        CustomFilterItem(
                          label: 'Hamstrings',
                          onTap: () {
                            provider.filterSelectedMus("Hamstrings");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                        CustomFilterItem(
                          label: 'Glutes',
                          onTap: () {
                            provider.filterSelectedMus("Glutes");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomFilterItem(
                          label: 'Core',
                          onTap: () {
                            provider.filterSelectedMus("Core");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                        CustomFilterItem(
                          label: 'Biceps',
                          onTap: () {
                            provider.filterSelectedMus("Biceps");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                        CustomFilterItem(
                          label: 'Forearms',
                          onTap: () {
                            provider.filterSelectedMus("Forearms");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                        CustomFilterItem(
                          label: 'Chest',
                          onTap: () {
                            provider.filterSelectedMus("Chest");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomFilterItem(
                          label: 'Shoulders',
                          onTap: () {
                            provider.filterSelectedMus("Shoulders");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                        CustomFilterItem(
                          label: 'Triceps',
                          onTap: () {
                            provider.filterSelectedMus("Triceps");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                        CustomFilterItem(
                          label: 'Calves',
                          onTap: () {
                            provider.filterSelectedMus("Calves");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomFilterItem(
                          label: 'Full Body',
                          onTap: () {
                            provider.filterSelectedMus("Full Body");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                        CustomFilterItem(
                          label: 'Back',
                          onTap: () {
                            provider.filterSelectedMus("Back");
                          },
                          selectedLabel: provider.selectedMus,
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    customTranslateText('Impact Level'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        CustomFilterItem(
                          label: 'Beginner',
                          onTap: () {
                            provider.filterSelectedLev("Beginner");
                          },
                          selectedLabel: provider.selectedLev,
                        ),
                        CustomFilterItem(
                          label: 'Intermediate',
                          onTap: () {
                            provider.filterSelectedLev("Intermediate");
                          },
                          selectedLabel: provider.selectedLev,
                        ),
                        CustomFilterItem(
                          label: 'Advanced',
                          onTap: () {
                            provider.filterSelectedLev("Advanced");
                          },
                          selectedLabel: provider.selectedLev,
                        ),
                      ],
                    ),
                    const Spacer(flex: 3),
                    provider.selectedCat.isNotEmpty ||
                            provider.selectedLev.isNotEmpty ||
                            provider.selectedMus.isNotEmpty
                        ? CustomButton(
                            label: "Done",
                            horizontalPadding: 15,
                            onPressed: () {
                              final allWorkouts =
                                  context.read<WorkoutsCubit>().allworkouts;
                              AnimatedNavigator().pop(context);
                              if (allWorkouts != null) {
                                provider.filterWorkouts(allWorkouts);
                              }
                            },
                          )
                        : const SizedBox(),
                    const Spacer(flex: 1),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
